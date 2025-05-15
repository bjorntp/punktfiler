-- Lazy plugin manager
require("lazy_init")
require("lazy").setup(require("plugins"))

-- lua/keymappings.lua
require("keymappings")

-- lua/options.lua
require("options")

-- snippets
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/my_snippets/" })

-- theme
vim.cmd.colorscheme("gruvbox")
