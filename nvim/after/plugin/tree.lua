local present, nvimtree = pcall(require, 'nvim-tree')

if not present then
    return
end

nvimtree.setup({
    hijack_cursor = true,
    update_cwd = true,

    renderer = {
        highlight_git = false,
        highlight_opened_files = 'none',
        icons = {
            show = {
                git = false
            }
        },
        special_files = {}
    },

    diagnostics = {
        enable = true,
        show_on_dirs = true
    },

    filters = {
        dotfiles = true,
    },
})

