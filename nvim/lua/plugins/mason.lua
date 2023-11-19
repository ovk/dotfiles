return {
    'williamboman/mason.nvim',

    event = 'VeryLazy',

    opts = {},

    config = function (_, opts)
        require('mason').setup(opts)
    end,
}

