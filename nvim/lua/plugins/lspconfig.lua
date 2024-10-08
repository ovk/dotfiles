return {
    'neovim/nvim-lspconfig',

    event = 'BufReadPre',

    config = function(_, opts)
        local lspconfig = require('lspconfig')

        -- C++
        lspconfig.clangd.setup({ on_attach = ovk_setup_lsp_keymap })

        -- Go
        lspconfig.gopls.setup({ on_attach = ovk_setup_lsp_keymap })

        -- Rust
        lspconfig.rust_analyzer.setup({ on_attach = ovk_setup_lsp_keymap })

        -- Python
        lspconfig.pyright.setup({ on_attach = ovk_setup_lsp_keymap })

        -- JavaScript, TypeScript
        lspconfig.ts_ls.setup({ on_attach = ovk_setup_lsp_keymap })

        -- YAML
        lspconfig.yamlls.setup({
            on_attach = ovk_setup_lsp_keymap,
            settings = {
                yaml = { keyOrdering = false },
                redhat = { telemetry = { enabled = false } }
            }
        })

        -- CSS
        lspconfig.cssls.setup({ on_attach = ovk_setup_lsp_keymap })

        -- Terraform
        lspconfig.terraformls.setup({ on_attach = ovk_setup_lsp_keymap })

        -- Diagnostic icons
        local signs = { Error = ' ', Warn = ' ', Hint = '', Info = '' }

        for type, icon in pairs(signs) do
            local hl = 'DiagnosticSign' .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        vim.diagnostic.config({ virtual_text = { prefix = '●' } })
    end,
}

