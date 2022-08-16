local present, lspconfig = pcall(require, 'lspconfig')

if not present then
    return
end

-- C++
lspconfig.clangd.setup({ on_attach = ovk_setup_lsp_keymap })

-- Go
lspconfig.gopls.setup({ on_attach = ovk_setup_lsp_keymap })

-- Python
lspconfig.pyright.setup({ on_attach = ovk_setup_lsp_keymap })

-- JavaScript, TypeScript
lspconfig.tsserver.setup({ on_attach = ovk_setup_lsp_keymap })

-- YAML
lspconfig.yamlls.setup({ on_attach = ovk_setup_lsp_keymap })

-- Terraform
lspconfig.tflint.setup({ on_attach = ovk_setup_lsp_keymap })

-- Diagnostic icons
local signs = { Error = '', Warn = '', Hint = '', Info = '' }

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({ virtual_text = { prefix = '●' } })

