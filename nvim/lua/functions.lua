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

return M
