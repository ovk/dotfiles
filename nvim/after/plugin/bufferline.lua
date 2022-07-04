local present, bufferline = pcall(require, 'bufferline')

if not present then
    return
end

bufferline.setup({
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
        buffer_selected = { gui = 'none' },
        numbers_selected = { gui = 'none' },
        diagnostic_selected = { gui = 'none' },
        info_selected = { gui = 'none' },
        info_selected = { gui = 'none' },
        info_diagnostic_selected = { gui = 'none' },
        warning_selected = { gui = 'none' },
        warning_diagnostic_selected = { gui = 'none' },
        error_selected = { gui = 'none' },
        error_diagnostic_selected = { gui = 'none' },
    },
})

ovk_bufferline_keymap(bufferline)

