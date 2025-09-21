return {
    'folke/trouble.nvim',

    dependencies = { 'nvim-tree/nvim-web-devicons' },

    keys = {
        { '<leader>tt', '<cmd>Trouble diagnostics toggle<cr>' },
    },

    opts = {
        warn_no_results = false,
        open_no_results = true,
    },

    config = function(_, opts)
        require('trouble').setup(opts)
    end,
}
