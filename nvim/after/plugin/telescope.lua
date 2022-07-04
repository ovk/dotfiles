local present, telescope = pcall(require, 'telescope')

if not present then
    return
end

telescope.setup({
    defaults = {
        layout_strategy = 'horizontal'
    }
})

local possession_present, possession = pcall(require, 'possession')
if possession_present then
    telescope.load_extension('possession')
end

