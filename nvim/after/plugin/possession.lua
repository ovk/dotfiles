local present, possession = pcall(require, 'possession')

if not present then
    return
end

possession.setup({
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
                filetype = { 'aerial'}
            }
        },
    }
})

