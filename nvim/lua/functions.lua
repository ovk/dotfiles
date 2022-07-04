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

-- Close current buffer (:bdelete) preserving window layout
function M.close_current_buffer()
    local bufnr = vim.api.nvim_get_current_buf()
    local force = false

    if vim.bo[bufnr].modified then
        vim.api.nvim_echo({{'Buffer is modified: (s)ave, (i)gnore, (a)bort?'}}, false, {})

        local action = string.char(vim.fn.getchar())

        if action == 's' or action == 'S' then
            vim.cmd('write')
        elseif action == 'i' or action == 'I' then
            force = true
        else
            return
        end
    end

    local windows = vim.tbl_filter(function(win) return vim.api.nvim_win_get_buf(win) == bufnr end, vim.api.nvim_list_wins())
    local buffers = vim.tbl_filter(
        function(buf) return
            vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted
        end,
        vim.api.nvim_list_bufs()
    )

    if #buffers > 1 then
        for i, v in ipairs(buffers) do
            if v == bufnr then
                local next_buf = buffers[i % #buffers + 1]
                for _, win in ipairs(windows) do
                    vim.api.nvim_win_set_buf(win, next_buf)
                end
                break
            end
        end
    end

    if vim.api.nvim_buf_is_valid(bufnr) then
        local command = force and 'bdelete!' or 'bdelete'
        vim.cmd(string.format('%s %d', command, bufnr))
    end
end

return M
