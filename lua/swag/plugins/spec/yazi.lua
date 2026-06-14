return {
    name = "yazi",
    src = "https://github.com/mikavilpas/yazi.nvim.git",

    dependencies = {
        {
            name = "plenary",
            src = "https://github.com/nvim-lua/plenary.nvim",
        },
    },

    setup = function()
        vim.g.loaded_netrwPlugin = 1
    end,

    config = {
        open_for_directories = true,
    },
}
