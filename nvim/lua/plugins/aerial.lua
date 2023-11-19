return {
    'stevearc/aerial.nvim',

    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    },

    keys = {
        { '<leader>lo', '<cmd>AerialToggle!<cr>' },
    },

    opts = {
        layout = {
            min_width = 25,
        },
        show_guides = true,
    },

    config = function (_, opts)
        require('aerial').setup(opts)
    end,
}

