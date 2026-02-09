if vim.loader then
  vim.loader.enable()
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.keymaps")
require("config.cmds")

if vim.g.noplugins == nil then
  require("config.lazy")
else
  vim.cmd.colorscheme("slate")
end
