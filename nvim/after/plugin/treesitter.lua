local present, nvimtreesitter = pcall(require, 'nvim-treesitter.configs')

if not present then
    return
end

nvimtreesitter.setup({
    ensure_installed = {
        'c',
        'cpp',
        'java',
        'go',
        'python',
        'haskell',
        'lua',
        'javascript',
        'typescript',
        'rust',
        'bash',
        'fish',
        'html',
        'css',
        'json',
        'yaml',
        'hcl',
        'markdown',
        'latex',
        'dockerfile',
        'make',
        'cmake',
    },

    highlight = {
        enable = true,
    },

    incremental_selection = {
        enable = true,
        keymaps = ovk_treesitter_keymap
    },

    indent = {
        enable = true
    },
})
