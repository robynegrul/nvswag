--- ----------------------------------------------------------- ---
--- STATUS LINE: LUALINE                                        ---
--- ----------------------------------------------------------- ---

local function os_icon()
    local os_name = vim.loop.os_uname().sysname

    if os_name == "Linux" then
        return ""
    elseif os_name == "Windows_NT" then
        return ""
    elseif os_name == "Darwin" then
        return ""
    end

    return "?"
end

local SEPARATORS = {
    POINTY  = { left = "", right = "", },
    ROUNDED = { left = "", right = "", },
}

return {
    name = "lualine",
    src = "https://github.com/nvim-lualine/lualine.nvim.git",

    config = {
        options = {
            section_separators = SEPARATORS.POINTY,
            component_separators = "",
            icons_enabled = true,
            globalstatus = true,
        },

        sections = {
            lualine_a = { "mode", },
            lualine_b = { "branch" },
            lualine_c = { "filename" },
            lualine_x = { "diagnostics", "filetype", "encoding" },
            lualine_y = { "progress", },
            lualine_z = {
                { "location", separator = SEPARATORS.ROUNDED },
                { os_icon },
            },
        },
    },
}
