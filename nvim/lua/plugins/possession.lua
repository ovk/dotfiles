return {
    'jedrzejboczar/possession.nvim',

    event = 'VimEnter',

    dependencies = { 'nvim-lua/plenary.nvim' },

    opts = {
        silent = true,
        autosave = {
            current = true
        },
        plugins = {
            delete_hidden_buffers = {
                hooks = {
                }
            },
            delete_buffers = true,
            close_windows = {
                hooks = { 'before_save', 'before_load' },
                preserve_layout = false,
                match = {
                    floating = true,
                    buftype = {},
                    filetype = { 'aerial' }
                }
            },
        }
    },

    config = function (_, opts)
        require('possession').setup(opts)
    end,
}

