-- FIXME: rewrite this when Lua support for augroup/autocmd is available
-- see https://github.com/neovim/neovim/pull/14661

-- Disable automatic comment insertion
vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]

-- Set tab with to two for some file types
vim.cmd [[autocmd FileType yaml :setlocal tabstop=2 softtabstop=2 shiftwidth=2]]

-- Highlight yanked text
vim.cmd [[
augroup yank_highlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END
]]

-- Remove trailing whitespaces on save
vim.cmd [[
augroup remove_trailing_space
    autocmd!
    autocmd BufWritePre * silent! lua RemoveTrailingWhitespace()
augroup END
]]

