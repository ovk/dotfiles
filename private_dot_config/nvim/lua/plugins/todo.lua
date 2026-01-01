return {
    'folke/todo-comments.nvim',

    lazy = false,

    dependencies = { 'nvim-lua/plenary.nvim' },

    opts = {
        keywords = {
            TODO = { icon = '', color = 'info' },
            PERF = { icon = '⏲', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
            TEST = { icon = '󰙨', color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },
        }
    }
}
