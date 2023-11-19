local regular_style = { bold = false, italic = false, underline = false, undercurl = false }

return {
    'akinsho/bufferline.nvim',

    lazy = false,

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

        highlights = {
            buffer_selected = regular_style,
            numbers_selected = regular_style,
            diagnostic_selected = regular_style,
            info_selected = regular_style,
            info_selected = regular_style,
            info_diagnostic_selected = regular_style,
            warning_selected = regular_style,
            warning_diagnostic_selected = regular_style,
            error_selected = regular_style,
            error_diagnostic_selected = regular_style,
        },
    },

    config = function (_, opts)
        local bufferline = require('bufferline')

        bufferline.setup(opts)

        ovk_bufferline_keymap(bufferline)
    end,
}

