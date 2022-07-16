local present, aerial = pcall(require, 'aerial')

if not present then
    return
end

aerial.setup({
    min_width = 20,
    show_guides = true,
    on_attach = ovk_aerial_keymap
})

vim.highlight.link('AerialClass', 'Type', true)
vim.highlight.link('AerialClassIcon', 'Keyword', true)
vim.highlight.link('AerialFunction', 'Function', true)
vim.highlight.link('AerialFunctionIcon', 'Keyword', true)
vim.highlight.link('AerialLine', 'QuickFixLine', true)
vim.highlight.link('AerialGuide', 'Comment', true)

