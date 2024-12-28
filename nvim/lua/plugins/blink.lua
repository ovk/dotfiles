return {
    'saghen/blink.cmp',

    version = 'v0.8.2',

    opts = {
        keymap = {
            preset = 'default',
            ['<CR>'] = { 'accept', 'fallback' },
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
