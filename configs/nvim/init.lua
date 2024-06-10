-- Config import
-- local plugins = require("plugins")
-- local lsp = require("lsp")
-- local combined_plugins = vim.tbl_deep_extend("force", plugins, lsp)

-- Lazy plugin manager
require("lazy_init")
require("lazy").setup(require("plugins"))

-- lua/keymappings.lua
require("keymappings")

-- lua/options.lua
require("options")

-- theme
vim.cmd.colorscheme("catppuccin")
