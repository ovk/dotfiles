return {
    'nvim-lualine/lualine.nvim',

    lazy = false,

    dependencies = { 'kyazdani42/nvim-web-devicons' },

    opts = {
        options = {
            theme = 'auto',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diagnostics' },
            lualine_c = { 'filename' },
            lualine_x = { 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
        },
        extensions = { 'nvim-tree' },
    },

    config = function (_, opts)
        require('lualine').setup(opts)
    end,
}

