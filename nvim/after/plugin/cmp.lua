local present, cmp = pcall(require, 'cmp')

if not present then
    return
end

cmp.setup({
    completion = {
        autocomplete = false
    },

    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    },

    mapping = ovk_cmp_keymap(cmp)
})
