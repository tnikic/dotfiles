local config = {}

-- Basic setup
local basic_config = require("basics.config")

-- Mux setup
local mux_config = require("mux.config")
require("mux.tabs")
require("mux.workspace")

-- Applying configurations
basic_config.apply_to_config(config)
mux_config.apply_to_config(config)

return config
