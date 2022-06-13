local utils = require('functions')

-- File type specific options
local ft_opts_grp = vim.api.nvim_create_augroup('ft_opts_grp', { clear = true })

vim.api.nvim_create_autocmd('FileType', { pattern = 'yaml', group = ft_opts_grp, callback = function ()
    utils.set_tab_width(2)
end })

-- Highlight yanked text
local hl_yank_grp = vim.api.nvim_create_augroup('hl_yank_grp', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', { group = hl_yank_grp, callback = function ()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 700 })
end })


-- Remove trailing white spaces on buffer save
local rm_trailing_ws_grp = vim.api.nvim_create_augroup('rm_trailing_ws_grp', { clear = true })

vim.api.nvim_create_autocmd('BufWritePre', { group = rm_trailing_ws_grp, callback = function ()
    utils.remove_trailing_whitespace()
end })

