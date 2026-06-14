--- ----------------------------------------------------------- ---
--- CLANGD LANGUAGE SERVER CONFIG                               ---
--- ----------------------------------------------------------- ---

vim.lsp.config("clangd", {
    cmd = { "clangd", },
    filetypes = { "c", "cpp", },

    root_markers = {
        ".clangd",
        ".clang-tidy",
        ".clang-format",
        "compile_commands.json",
        "CMakeLists.txt",
        ".git",
    },
})
