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
            'terraform',
            'make',
            'cmake',
        },

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
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

