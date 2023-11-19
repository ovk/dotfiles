return {
    'folke/trouble.nvim',

    dependencies = { 'nvim-tree/nvim-web-devicons' },

    keys = {
        { '<leader>tt', '<cmd>TroubleToggle<cr>' },
    },

    opts = {},

    config = function (_, opts)
        require('trouble').setup(opts)
    end,
}

