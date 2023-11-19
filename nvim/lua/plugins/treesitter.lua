return {
    'nvim-treesitter/nvim-treesitter',

    event = 'BufReadPost',

    build = ':TSUpdate',

    opts = {
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
    },

    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end,
}

