return {
    'windwp/nvim-autopairs',

    event = 'InsertEnter',

    opts = {},

    config = function(_, opts)
        require('nvim-autopairs').setup(opts)
    end,
}
