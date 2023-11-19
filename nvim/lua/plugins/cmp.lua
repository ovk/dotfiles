return {
    'hrsh7th/nvim-cmp',

    event = 'InsertEnter',

    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
    },

    opts = {
        completion = {
            autocomplete = false,
        },

        sources = {
            { name = 'nvim_lsp' },
            { name = 'buffer' },
        },
    },

    config = function (_, opts)
        local cmp = require('cmp')

        opts.mapping = ovk_cmp_keymap(cmp)

        cmp.setup(opts)
    end,
}

