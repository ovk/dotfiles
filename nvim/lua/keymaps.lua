local map = vim.api.nvim_set_keymap
local lmap = vim.keymap.set
local utils = require('functions')

-- Map leader key to space
vim.g.mapleader = ' '

-- Quick buffer navigation (next/previous)
map('n', '<C-n>', ':bnext<cr>', { noremap = true, silent = true })
map('n', '<C-p>', ':bprev<cr>', { noremap = true, silent = true })

-- Mappings for 'D|C|P' to use unnamed register
map('n', '<leader>d', '"_d', { noremap = true })
map('n', '<leader>D', '"_D', { noremap = true })
map('n', '<leader>c', '"_c', { noremap = true })
map('n', '<leader>C', '"_C', { noremap = true })
map('x', '<leader>p', "\"_dP", { noremap = true })

-- Bufferline
function ovk_bufferline_keymap(bufferline)
    -- Navigate listed buffers with <leader>1-9
    for i = 1, 9 do
        lmap('n', '<leader>' .. i, function () bufferline.go_to_buffer(i, true) end, { noremap = true, silent = true })
    end
end

-- Close current buffer preserving windows layout
lmap('n', '<C-Bs>', utils.close_current_buffer, { noremap = true, silent = true })

-- LSP mappings
function ovk_setup_lsp_keymap(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    local telescope = require('telescope.builtin')

    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Always show sign column with diagnostics icons
    vim.opt_local.signcolumn = 'yes'

    -- Mappings
    lmap('n', 'K', vim.lsp.buf.hover, bufopts)
    lmap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    lmap('i', '<C-k>', vim.lsp.buf.signature_help, bufopts)

    lmap('n', 'gd', telescope.lsp_definitions, bufopts)
    lmap('n', '<C-]>', telescope.lsp_definitions, bufopts)
    lmap('n', 'gD', vim.lsp.buf.declaration, bufopts)

    lmap('n', '<leader>li', telescope.lsp_implementations, bufopts)
    lmap('n', '<leader>lr', telescope.lsp_references, bufopts)
    lmap('n', '<leader>ls', telescope.lsp_document_symbols, bufopts)
    lmap('n', '<leader>lS', telescope.lsp_workspace_symbols, bufopts)
    lmap('n', '<leader>ll', telescope.diagnostics, bufopts)

    lmap('n', '<leader>aa', vim.lsp.buf.code_action, bufopts)
    lmap('n', '<leader>an', vim.lsp.buf.rename, bufopts)
    lmap('n', '<leader>af', function() vim.lsp.buf.format({async=true}) end, bufopts)

    if client.server_capabilities.documentHighlightProvider then
        lmap('n', '<leader>ah', vim.lsp.buf.document_highlight, bufopts)
        lmap('n', '<leader>aH', vim.lsp.buf.clear_references, bufopts)
    end
end

-- Completion mappings
function ovk_cmp_keymap(cmp)
    return {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-u>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true })
    }
end

-- Treesitter mappings
ovk_treesitter_keymap = {
   init_selection = 'gri',
   node_incremental = 'grn',
   node_decremental = 'grm',
   scope_incremental = 'grc'
}

-- DAP (debugging)
function ovk_dap_keymap(dap)
    local bufopts = { noremap = true, silent = true }

    lmap('n', '<leader>bt', dap.toggle_breakpoint, bufopts)
    lmap('n', '<leader>bc', function () dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, bufopts)
    lmap('n', '<leader>bl', function () dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, bufopts)

    lmap('n', '<F5>', dap.continue, bufopts)
    lmap('n', '<F10>', dap.step_over, bufopts)
    lmap('n', '<F11>', dap.step_into, bufopts)
    lmap('n', '<F12>', dap.step_out, bufopts)
end

