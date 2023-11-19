return {
    'andersevenrud/nordic.nvim',

    lazy = false,

    priority = 1000,

    config = function ()
        require('nordic').colorscheme({
            underline_option = 'undercurl',
            italic = false,
            italic_comments = false,
        })
    end,
}

