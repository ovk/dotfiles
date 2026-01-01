local map = vim.api.nvim_set_keymap
local lmap = vim.keymap.set
local utils = require('functions')

-- Map leader key to space
vim.g.mapleader = ' '

-- Quick buffer navigation (next/previous)
map('n', '<C-n>', ':bnext<cr>', { noremap = true, silent = true })
map('n', '<C-p>', ':bprev<cr>', { noremap = true, silent = true })

-- Close current buffer preserving windows layout
lmap('n', '<C-Bs>', function() utils.close_current_buffer({ 'NvimTree' }) end, { noremap = true, silent = true })

-- Mappings for 'D|C|P' to use unnamed register
map('n', '<leader>d', '"_d', { noremap = true })
map('n', '<leader>D', '"_D', { noremap = true })
map('n', '<leader>c', '"_c', { noremap = true })
map('n', '<leader>C', '"_C', { noremap = true })
map('x', '<leader>p', '\"_dP', { noremap = true })
