return {
  {
    "dundalek/lazy-lsp.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      {"VonHeikemen/lsp-zero.nvim", branch = "v3.x"},
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      local lsp_zero = require("lsp-zero")

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings to learn the available actions
        lsp_zero.default_keymaps({
          buffer = bufnr,
          preserve_mappings = false
        })
      end)

      require("lazy-lsp").setup {}
    end,
  },
  {
    "williamboman/mason.nvim",
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
  {
    "tamago324/nlsp-settings.nvim", cmd = "LspSettings", lazy = true
  },
  {
    "folke/neodev.nvim",
  },
  {
    "hrsh7th/nvim-cmp",
  },
  {
    "numToStr/Comment.nvim",
  },
  {
    "m4xshen/autoclose.nvim",
  },
  {
    "kevinhwang91/rnvimr",
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
    }
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 50
    end,
    opts = {
          defaults = {
        ["<leader>f"] = { name = "+telescope" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSupdate" },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep", "nvim-treesitter/nvim-treesitter" }
  },
  {
    "catppuccin/nvim", name = "catppuccin", priority = 1000
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup()
    end,
    event = "VimEnter",
  },
}
