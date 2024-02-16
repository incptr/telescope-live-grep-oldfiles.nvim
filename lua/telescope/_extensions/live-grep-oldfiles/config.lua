local builtin = require("telescope.builtin")
local utils = require("telescope.utils")

local config = {}

local default_config = {
	prompt_title = "Live Grep (Oldfiles)",
}

local current_config = default_config

config.get_config = function()
	return current_config
end

config.setup = function(user_config) end

return config
