local packer = require('packer')

packer.startup({ function()
    -- packer
    use 'wbthomason/packer.nvim'

    -- nvim-treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- nordic (color scheme)
    use {
        'andersevenrud/nordic.nvim',
        config = function()
            require('nordic').colorscheme({
                underline_option = 'undercurl',
                italic = false,
                italic_comments = false,
            })
        end
    }

    -- nvim-tree (file manager)
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons'
        }
    }

    -- nvim-lspconfig
    use 'neovim/nvim-lspconfig'

    -- fidget (LSP status indicator)
    use {
        'j-hui/fidget.nvim',
        tag = 'legacy', -- TODO: remove this once fidget.nvim rewrite is complete
        config = function ()
            require('fidget').setup({})
        end
    }

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- possession (session manager)
    use {
        'jedrzejboczar/possession.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- nvim-cmp (completion)
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer'
        }
    }

    -- comment.nvim
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- nvim-autopairs
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end
    }

    -- lualine (status line)
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    -- bufferline.nvim
    use {
        'akinsho/bufferline.nvim',
        tag = 'v4.*',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    -- nvim-dap (debug)
    use 'mfussenegger/nvim-dap'

    -- nvim-dap-ui
    use {
        'rcarriga/nvim-dap-ui',
        requires = { 'mfussenegger/nvim-dap' }
    }

    -- aerial.nvim (outline)
    use 'stevearc/aerial.nvim'

    -- mason.nvim (package manager)
    use 'williamboman/mason.nvim'

end,
    config = {
        display = {
            open_fn = require('packer.util').float,
        }
    }
})

