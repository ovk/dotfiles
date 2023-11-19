return {
    'nvim-telescope/telescope.nvim',

    dependencies = {
        'nvim-lua/plenary.nvim',
        'jedrzejboczar/possession.nvim',
    },

    keys = {
        { '<leader>ff', '<cmd>Telescope find_files<cr>' },
        { '<leader>fg', '<cmd>Telescope live_grep<cr>' },
        { '<leader>fb', '<cmd>Telescope buffers<cr>' },
        { '<leader>fh', '<cmd>Telescope help_tags<cr>' },
        { '<leader>fs', '<cmd>Telescope possession list<cr>' },
    },

    opts = {
        defaults = {
            layout_strategy = 'horizontal'
        }
    },

    config = function (_, opts)
        local telescope = require('telescope')

        telescope.setup(opts)
        telescope.load_extension('possession')
    end,
}

