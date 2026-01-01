local utils = require('functions')

-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('ovk.hl_on_yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 700 })
    end
})

-- Remove trailing white spaces on buffer save
vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('ovk.rm_trailing_space', { clear = true }),
    callback = function()
        utils.remove_trailing_whitespace()
    end
})

-- Open help window in a vertical split
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('ovk.open_help_vertical', { clear = true }),
    pattern = 'help',
    callback = function()
        vim.cmd.wincmd('L')
    end
})
