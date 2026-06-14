--- ----------------------------------------------------------- ---
--- LUA LANGUAGE SERVER CONFIG                                  ---
--- ----------------------------------------------------------- ---

vim.lsp.config("lua-ls", {
    cmd = { "lua-language-server", },
    filetypes = { "lua", },

    root_markers = {
        { ".luarc.json", ".luarc.jsonc", },
        ".git",
    },

    settings = {
        Lua = {
            telemetry = { enable = false, },
            runtime = { version = "LuaJIT", },

            diagnostics = {
                globals = { "require", "vim", },
            },
        },
    },
})
