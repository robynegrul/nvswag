-- expand tabs to spaces
local numspaces = 4

vim.o.expandtab = true
vim.o.shiftwidth = numspaces
vim.o.tabstop = numspaces
vim.o.softtabstop = numspaces

-- show line numbers
vim.o.number = true
vim.o.numberwidth = numspaces

-- enable sign column
vim.o.signcolumn = "yes"

-- render whitespaces
vim.o.list = true
vim.opt.listchars = {
    space = "·",
    tab = "→ ",
    trail = "·",
    extends = "»",
    precedes = "«",
    nbsp = "␣",
}

-- popup menu
vim.o.pumborder = "single"
vim.o.pumheight = 10
vim.o.pummaxwidth = 60

-- set cursor scrolloff
vim.o.scrolloff = 8

-- hide command line when not used
vim.o.cmdheight = 0

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    callback = function () vim.hl.on_yank() end,
})
