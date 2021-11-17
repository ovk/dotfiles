local map = vim.api.nvim_set_keymap

-- Map leader key to space
vim.g.mapleader = ' '

-- Clear current search and perform default Ctrl-L action (redraw)
map('n', '<C-l>', ':let @/=""<CR><C-l>', { noremap = true, silent = true })

-- Quick buffer navigation (next/previous)
map('n', '<C-n>', ':bnext<CR>', { noremap = true, silent = true })
map('n', '<C-p>', ':bprev<CR>', { noremap = true, silent = true })

-- Map 'Y' to copy from cursor position till EOL
map('n', 'Y', 'y$', { noremap = true })

-- Mappings for 'D|C' to use unnamed register
map('n', '<leader>d', '"_d', { noremap = true })
map('n', '<leader>D', '"_D', { noremap = true })
map('n', '<leader>c', '"_c', { noremap = true })
map('n', '<leader>C', '"_C', { noremap = true })

-- Move selected lines up/down
map('x', 'K', ":move '<-2<CR>gv=gv", { noremap = true })
map('x', 'J', ":move '>+1<CR>gv=gv", { noremap = true })

-- Detect and highlight tabs
map('n', '<leader>ht', '<Cmd>lua DetectTabs()<CR>', { noremap = true })

