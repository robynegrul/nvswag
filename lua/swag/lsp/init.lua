require("swag.lsp.spec.lua-ls")
vim.lsp.enable("lua-ls")

require("swag.lsp.spec.clangd")
vim.lsp.enable("clangd")

local severity = vim.diagnostic.severity

vim.diagnostic.config({
    update_in_insert = true,
    severity_sort = true,

    signs = {
        text = {
            [severity.ERROR]    = "",
            [severity.WARN]     = "",
            [severity.INFO]     = "",
            [severity.HINT]     = "",
        },
    },
})

-- enable autocomplete
vim.o.autocomplete = true
vim.opt.completeopt = {
    "menu",
    "menuone",
    "noselect",
    "noinsert",
}

local function on_attach(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)


    if client:supports_method("textDocument/completion") then
        vim.lsp.completion.enable(true, client.id, ev.buf, {
            autotrigger = true,
        })
    end
end

vim.api.nvim_create_autocmd("LspAttach", { callback = on_attach, })
