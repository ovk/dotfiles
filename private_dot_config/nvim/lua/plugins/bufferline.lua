return {
    'akinsho/bufferline.nvim',

    dependencies = { 'nvim-tree/nvim-web-devicons' },

    lazy = false,

    after = 'catppuccin',

    keys = {
        -- Quick navigation between buffers
        { '<leader>1', '<cmd>BufferLineGoToBuffer 1<cr>' },
        { '<leader>2', '<cmd>BufferLineGoToBuffer 2<cr>' },
        { '<leader>3', '<cmd>BufferLineGoToBuffer 3<cr>' },
        { '<leader>4', '<cmd>BufferLineGoToBuffer 4<cr>' },
        { '<leader>5', '<cmd>BufferLineGoToBuffer 5<cr>' },
        { '<leader>6', '<cmd>BufferLineGoToBuffer 6<cr>' },
        { '<leader>7', '<cmd>BufferLineGoToBuffer 7<cr>' },
        { '<leader>8', '<cmd>BufferLineGoToBuffer 8<cr>' },
        { '<leader>9', '<cmd>BufferLineGoToBuffer 9<cr>' },
    },

    opts = {
        options = {
            numbers = 'ordinal',
            diagnostics = 'nvim_lsp',
            diagnostics_indicator = function(count, level)
                local icon = level:match('error') and ' ' or ' '
                return ' ' .. icon .. count
            end,
            offsets = {
                { filetype = 'NvimTree', text = 'File Explorer', text_align = 'center' }
            },
            show_buffer_icons = false,
            show_buffer_close_icons = false,
            show_close_icon = false
        },

    },

    config = function(_, opts)
        local bufferline = require('bufferline')

        opts['highlights'] = require('catppuccin.groups.integrations.bufferline').get_theme({
            styles = {},
        })

        bufferline.setup(opts)
    end,
}
