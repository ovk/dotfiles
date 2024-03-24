local M = {}

-- Remove all trailing white spaces from the current buffer
function M.remove_trailing_whitespace()
    if  vim.bo.modifiable == false or
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

-- Convenient function to set indentation width
function M.set_tab_width(width)
    vim.api.nvim_buf_set_option(0, 'tabstop', width)
    vim.api.nvim_buf_set_option(0, 'softtabstop', width)
    vim.api.nvim_buf_set_option(0, 'shiftwidth', width)
end

-- Close current buffer (:bdelete) trying to preserve window layout
function M.close_current_buffer(no_close_list)
    local bufnr = vim.api.nvim_get_current_buf()
    local bufname = vim.api.nvim_buf_get_name(bufnr);
    local force = false

    -- Don't close buffers with name that matches one in 'no_close_list'
    if no_close_list ~= nil then
        for _, bufmatch in ipairs(no_close_list) do
            if bufname:match(bufmatch) then
                return
            end
        end
    end

    -- Ask for action if the buffer is modified
    if vim.bo[bufnr].modified then
        vim.api.nvim_echo({{'Buffer is modified: (s)ave, (i)gnore, (a)bort?'}}, false, {})

        local action = string.char(vim.fn.getchar())

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
    local windows = vim.tbl_filter(function(win) return vim.api.nvim_win_get_buf(win) == bufnr end, vim.api.nvim_list_wins())
    local buffers = vim.tbl_filter(
        function(buf) return
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
        target_bufnr = vim.api.nvim_create_buf(true, false)
    end

    for _, win in ipairs(windows) do
        vim.api.nvim_win_set_buf(win, target_bufnr)
    end

    if vim.api.nvim_buf_is_valid(bufnr) then
        vim.cmd.bwipeout({ count = bufnr, bang = force })
    end
end

return M
