return {
    'nvim-treesitter/nvim-treesitter',

    lazy = false,

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
            'markdown_inline',
            'dockerfile',
            'terraform',
            'make',
            'cmake',
        },

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },

        indent = {
            enable = true
        },
    },

    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end,
}
