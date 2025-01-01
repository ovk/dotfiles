return {
    'saghen/blink.cmp',

    version = 'v0.9.0',

    opts = {
        keymap = {
            preset = 'default',

            ['<CR>'] = { 'accept', 'fallback' },

            ['<Tab>'] = {
                function(cmp)
                    if (vim.api.nvim_get_mode().mode == 'c') then
                        return cmp.show()
                    end
                end,
                'fallback'
            },
        },

        completion = {
            documentation = { auto_show = true, auto_show_delay_ms = 500 },
            ghost_text = { enabled = false },
            menu = { auto_show = function(ctx) return ctx.mode ~= 'cmdline' end }
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono'
        },

        signature = { enabled = true },

        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
    },

    opts_extend = { "sources.default" }
}
