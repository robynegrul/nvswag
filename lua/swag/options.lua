-- expand tabs to spaces
local numspaces = 4

vim.o.expandtab = true
vim.o.shiftwidth = numspaces
vim.o.tabstop = numspaces
vim.o.softtabstop = numspaces

vim.o.smartindent = true
vim.o.autoindent = true

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
vim.o.scrolloff = 20

-- better cursor navigation
vim.opt.whichwrap:append("<,>,[,],h,l")

-- hide command line when not used
vim.o.cmdheight = 0

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    callback = function () vim.hl.on_yank() end,
})

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "BufEnter" }, {
    group = vim.api.nvim_create_augroup("ScrollOffEOF", {}),
    callback = function()
        local win_h = vim.api.nvim_win_get_height(0)
        local off = math.min(vim.o.scrolloff, math.floor(win_h / 2))
        local dist = vim.fn.line "$" - vim.fn.line "."
        local rem = vim.fn.line "w$" - vim.fn.line "w0" + 1
        if dist < off and win_h - rem + dist < off then
            local view = vim.fn.winsaveview()
            view.topline = view.topline + off - (win_h - rem + dist)
            vim.fn.winrestview(view)
        end
    end,
})
