return {
    'nvim-tree/nvim-tree.lua',

    dependencies = { 'nvim-tree/nvim-web-devicons' },

    keys = {
        { '<leader>et', '<cmd>NvimTreeToggle<cr>' },
        { '<leader>ee', '<cmd>NvimTreeFocus<cr>' },
    },

    opts = {
        hijack_cursor = true,
        update_cwd = true,

        actions = {
            open_file = {
                resize_window = false
            }
        },

        renderer = {
            highlight_git = false,
            highlight_opened_files = 'none',
            icons = {
                show = {
                    git = false
                }
            },
            special_files = {},
            root_folder_label = false
        },

        view = {
            width = 32,
        },

        diagnostics = {
            enable = true,
            show_on_dirs = true
        },

        filters = {
            dotfiles = true,
        },

        on_attach = function(bufnr)
            local api = require('nvim-tree.api')

            local function opts(desc)
                return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            -- Default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- Custom mappings
            vim.keymap.set('n', 'gh', api.tree.toggle_hidden_filter, opts('Toggle hidden'))

            -- Restore original H/M/L mappings since they are convenient for navigation
            vim.api.nvim_buf_del_keymap(bufnr, 'n', 'H')
            vim.api.nvim_buf_del_keymap(bufnr, 'n', 'M')
            vim.api.nvim_buf_del_keymap(bufnr, 'n', 'L')

            -- Some intuitive folder navigation with h/l
            vim.keymap.set('n', 'h', function()
                local node = api.tree.get_node_under_cursor()
                if (node.nodes and node.open) then
                    api.node.open.edit()
                else
                    api.node.navigate.parent()
                end
            end, opts('Ascend / Close'))

            vim.keymap.set('n', 'l', function()
                local node = api.tree.get_node_under_cursor()
                if (not node.open) then
                    api.node.open.edit()
                end
            end, opts('Descent / Open'))
        end
    },

    config = function(_, opts)
        require('nvim-tree').setup(opts)
    end,
}
