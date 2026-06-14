--- ----------------------------------------------------------- ---
--- COLORSCHEME: CATPPUCCIN (MOCHA)                             ---
--- ----------------------------------------------------------- ---

return {
    name = "catppuccin",
    src = "https://github.com/catppuccin/nvim.git",

    setup = function()
        vim.cmd.colorscheme("catppuccin")
    end,

    config = {
        flavour = "mocha",
        background = {
            dark = "mocha",
            light = "latte",
        },
    },
}
