return {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = { vim.env.VIMRUNTIME, "${3rd}/luv/library" },
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    }
}
