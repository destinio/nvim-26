-- Set leader keys for key mappings
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load configuration modules
require("config.options") -- Vim options and settings
require("config.keymaps") -- Key mappings
require("config.lazy")    -- Lazy.nvim plugin manager
require("config.cmds")    -- Custom commands
