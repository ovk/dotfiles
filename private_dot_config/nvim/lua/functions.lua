local M = {}

--- Remove all trailing white spaces in the current buffer.
function M.remove_trailing_whitespace()
    if vim.bo.modifiable == false or
        vim.bo.modified == false or
        vim.bo.binary == true or
        vim.bo.filetype == 'xxd' or
        vim.bo.filetype == 'diff' then
        return
    end

    local state = vim.fn.winsaveview()
    vim.api.nvim_command('keepjumps keeppatterns %s/\\s\\+$//e')
    vim.fn.winrestview(state)
end

--- Close current buffer (:bdelete) trying to preserve window layout.
---
---@param no_close_list string[]
function M.close_current_buffer(no_close_list)
    local bufnr = vim.api.nvim_get_current_buf()
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    local force = false

    -- Don't close buffers with name that matches one in 'no_close_list'
    if no_close_list then
        for _, bufmatch in ipairs(no_close_list) do
            if bufname:match(bufmatch) then
                return
            end
        end
    end

    -- If the window already has placeholder buffer, there is nothing left to close
    if vim.b[bufnr].ovk_placeholder_scratch then
        return
    end

    -- Ask for action if the buffer is modified
    if vim.bo[bufnr].modified then
        vim.api.nvim_echo({ { 'Buffer is modified: (s)ave, (i)gnore, (a)bort?' } }, false, {})

        local action = vim.fn.getcharstr()

        if action == 's' or action == 'S' then
            vim.api.nvim_buf_call(bufnr, function() vim.cmd.write() end)
        elseif action == 'i' or action == 'I' then
            force = true
        else
            return
        end
    end

    -- If the buffer is unlisted (e.g. help) or quick fix: just close it without trying to preserve window
    if not vim.api.nvim_buf_is_valid(bufnr) or not vim.bo[bufnr].buflisted or vim.bo[bufnr].bt == 'quickfix' then
        vim.cmd.bwipeout({ count = bufnr, bang = force })
        return
    end

    -- Try to find a buffer which we can use in place of deleted buffer
    local buffers = vim.tbl_filter(
        function(buf)
            return
                vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted
        end,
        vim.api.nvim_list_bufs()
    )

    local target_bufnr

    if #buffers > 1 then
        for i, v in ipairs(buffers) do
            if v ~= bufnr then
                target_bufnr = buffers[i]
                break
            end
        end
    end

    if target_bufnr == nil then
        target_bufnr = vim.api.nvim_create_buf(false, true)
        vim.b[target_bufnr].ovk_placeholder_scratch = true
    end

    for _, win in ipairs(vim.fn.win_findbuf(bufnr)) do
        vim.api.nvim_win_set_buf(win, target_bufnr)
    end

    if vim.api.nvim_buf_is_valid(bufnr) then
        vim.cmd.bwipeout({ count = bufnr, bang = force })
    end
end

return M
