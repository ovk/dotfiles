local present, aerial = pcall(require, 'aerial')

if not present then
    return
end

aerial.setup({
    min_width = 20,
    show_guides = true,
    on_attach = ovk_aerial_keymap
})

