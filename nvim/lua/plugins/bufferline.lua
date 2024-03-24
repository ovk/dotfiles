local regular_style = { bold = false, italic = false, underline = false, undercurl = false }

return {
    'akinsho/bufferline.nvim',

    lazy = false,

    after = 'catppuccin',

    opts = {
        options = {
            numbers = 'ordinal',
            diagnostics = 'nvim_lsp',
            diagnostics_indicator = function (count, level, diagnostics_dict, context)
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

    config = function (_, opts)
        local bufferline = require('bufferline')

        opts['highlights'] = require('catppuccin.groups.integrations.bufferline').get({
            styles = {},
        })

        bufferline.setup(opts)

        ovk_bufferline_keymap(bufferline)
    end,
}

