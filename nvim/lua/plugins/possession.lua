return {
    'jedrzejboczar/possession.nvim',

    event = 'VimEnter',

    dependencies = { 'nvim-lua/plenary.nvim' },

    opts = {
        silent = true,
        autosave = {
            current = true
        },
        hooks = {
            before_load = function(_, user_data)
                -- Force load DAP to avoid error
                require('dap')
                return user_data
            end,
            before_save = function()
                -- Force load DAP to avoid error
                require('dap')
                return {}
            end,
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

    config = function(_, opts)
        require('possession').setup(opts)
    end,
}
