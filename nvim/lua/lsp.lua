local telescope = require('telescope.builtin')
local lmap = vim.keymap.set

-- Enable language servers
vim.lsp.enable({
    'luals',
    'gopls',
    'clangd',
    'pyright',
    'tsls',
    'cssls',
    'htmlls',
    'yamlls',
    'terraformls' })

-- Built-int diagnostic config
vim.diagnostic.config({
    virtual_text = { prefix = '' },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '',
        },
        numhl = {
            [vim.diagnostic.severity.WARN] = 'WarningMsg',
        }
    }
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('ovk.lsp', {}),
    callback = function(ev)
        local bufopts = { noremap = true, silent = true, buffer = ev.buf }

        -- The default <CTRL+S> isn't very intuitive and <CTRL+K> is similar to 'K' in normal mode.
        lmap('i', '<C-k>', vim.lsp.buf.signature_help, bufopts)

        -- While since Neovim 0.11 there are some default mappings for LSP, I find these
        -- much easier to memorize and type (lr - list references, ls - list symbols etc.).
        lmap('n', '<leader>li', telescope.lsp_implementations, bufopts)
        lmap('n', '<leader>lr', telescope.lsp_references, bufopts)
        lmap('n', '<leader>ls', telescope.lsp_document_symbols, bufopts)
        lmap('n', '<leader>lS', telescope.lsp_workspace_symbols, bufopts)
        lmap('n', '<leader>ll', telescope.diagnostics, bufopts)
        lmap('n', '<leader>aa', vim.lsp.buf.code_action, bufopts)
        lmap('n', '<leader>an', vim.lsp.buf.rename, bufopts)
        lmap('n', '<leader>ah', vim.lsp.buf.document_highlight, bufopts)
        lmap('n', '<leader>aH', vim.lsp.buf.clear_references, bufopts)
        lmap('n', '<leader>af', function() vim.lsp.buf.format({ async = true }) end, bufopts)
    end
})
