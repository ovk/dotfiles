return {
    'neovim/nvim-lspconfig',

    dependencies = { 'saghen/blink.cmp' },

    event = 'BufReadPre',

    config = function(_, opts)
        local lspconfig = require('lspconfig')
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        -- C++
        lspconfig.clangd.setup({ on_attach = ovk_setup_lsp_keymap, capabilities = capabilities })

        -- Go
        lspconfig.gopls.setup({ on_attach = ovk_setup_lsp_keymap, capabilities = capabilities })

        -- Rust
        lspconfig.rust_analyzer.setup({ on_attach = ovk_setup_lsp_keymap, capabilities = capabilities })

        -- Python
        lspconfig.pyright.setup({ on_attach = ovk_setup_lsp_keymap, capabilities = capabilities })

        -- JavaScript, TypeScript
        lspconfig.ts_ls.setup({ on_attach = ovk_setup_lsp_keymap, capabilities = capabilities })

        -- Lua
        lspconfig.lua_ls.setup({
            on_attach = ovk_setup_lsp_keymap,
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                        path = vim.split(package.path, ";"),
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = { vim.env.VIMRUNTIME },
                        checkThirdParty = false,
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })

        -- YAML
        lspconfig.yamlls.setup({
            on_attach = ovk_setup_lsp_keymap,
            capabilities = capabilities,
            settings = {
                yaml = { keyOrdering = false },
                redhat = { telemetry = { enabled = false } }
            }
        })

        -- CSS
        lspconfig.cssls.setup({ on_attach = ovk_setup_lsp_keymap, capabilities = capabilities })

        -- Terraform
        lspconfig.terraformls.setup({ on_attach = ovk_setup_lsp_keymap, capabilities = capabilities })

        -- Diagnostic icons
        local signs = { Error = ' ', Warn = ' ', Hint = '', Info = '' }

        for type, icon in pairs(signs) do
            local hl = 'DiagnosticSign' .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        vim.diagnostic.config({ virtual_text = { prefix = '●' } })
    end,
}
