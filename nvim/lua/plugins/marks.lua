return {
    'chentoast/marks.nvim',

    event = 'VeryLazy',

    opts = {
        default_mappings = true,
        refresh_interval = 500,
        excluded_filetypes = {},
    },

    config = function (_, opts)
        require('marks').setup(opts)
    end,
}

