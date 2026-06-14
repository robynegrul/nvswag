require("swag.options")
require("swag.remaps")
require("swag.lsp")

local plugg = require("swag.plugg")

local loaded = plugg.load(require("swag.plugins"))
plugg.setup(loaded)
