return {
    'nvim-tree/nvim-tree.lua',

    dependencies = { 'nvim-tree/nvim-web-devicons' },

    keys = {
        { '<leader>et', '<cmd>NvimTreeToggle<cr>' },
        { '<leader>ee', '<cmd>NvimTreeFocus<cr>' },
    },

    opts = {
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
    },

    config = function (_, opts)
        require('nvim-tree').setup(opts)
    end,
}

