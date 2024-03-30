-- Lazy plugin manager
require("lazy_init")
require("lazy").setup(require("plugins"))

-- lua/settings.lua
require("settings")

require("Comment").setup()
require("autoclose").setup()

-- local lspconfig = require('lspconfig')
-- lspconfig.pyright.setup({})
-- lspconfig.tsserver.setup({})

-- lua/keymappsing.lua
require("keymappings")

-- theme
vim.cmd.colorscheme "catppuccin-mocha"
