local M = {}

function M.load(names)
    local specs = {}
    for _, name in ipairs(names) do
        local ok, spec = pcall(require, "swag.plugins.spec." .. name)

        if ok then
            spec.name = spec.name or name

            -- load dependencies
            if type(spec.dependencies) == "table" then
                for _, dep in ipairs(spec.dependencies) do
                    table.insert(specs, dep)
                end
            end

            table.insert(specs, spec)
        else
            vim.notify("Failed to load plugin: " .. name)
        end
    end
    return specs
end

function M.install(specs)
    vim.pack.add(vim.tbl_map(function(spec)
        return { name = spec.name, src = spec.src, }
    end, specs))
end

function M.setup(specs)
    M.install(specs)
    for _, spec in ipairs(specs) do
        local name = spec.name

        if type(spec.config) == "table" then
            local ok, plugin = pcall(require, name)
            if ok and type(plugin.setup) == "function" then
                plugin.setup(spec.config)
            else
                vim.notify("Failed to apply plugin configuration for: " .. name, vim.log.levels.WARN)
            end
        end

        if type(spec.setup) == "function" then
            spec.setup()
        end
    end
end

return M
