return {
    'j-hui/fidget.nvim',

    event = 'VeryLazy',

    opts = {},

    config = function (_, opts)
        require('fidget').setup(opts)
    end,
}

