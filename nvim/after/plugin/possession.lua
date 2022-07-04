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
        delete_buffers = true
    }
})
