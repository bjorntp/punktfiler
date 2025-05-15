return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },

      -- LSP enhancements
      { 'folke/neodev.nvim',    opts = {} },
      { 'j-hui/fidget.nvim',    opts = {} },
    },
    config = function()
      local lsp_zero = require('lsp-zero')

      -- Configure capabilities (we'll import from cmp)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if has_cmp then
        capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())
      end

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })

        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end

        -- Your custom keybindings
        map("<leader>cgd", require("telescope.builtin").lsp_definitions, "Goto Definition")
        map("<leader>cgr", require("telescope.builtin").lsp_references, "Goto References")
        map("<leader>cgI", require("telescope.builtin").lsp_implementations, "Goto Implementation")
        map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type Definition")
        map("<leader>cs", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
        map("<leader>cr", vim.lsp.buf.rename, "Rename")
        map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("gD", vim.lsp.buf.declaration, "Goto Declaration")

        -- Document highlight setup
        if client and client.server_capabilities.documentHighlightProvider then
          local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = bufnr,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = bufnr,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
            callback = function(event)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event.buf })
            end,
          })
        end
      end)

      -- Define your language servers with paths to NixOS system-installed binaries
      local servers = {
        clangd = {
          cmd = { "clangd" },
        },
        bashls = {
          cmd = { "bash-language-server", "start" },
        },
        pyright = {
          cmd = { "pyright-langserver", "--stdio" },
        },
        ts_ls = {
          cmd = { "typescript-language-server", "--stdio" },
        },
        rust_analyzer = {
          cmd = { "rust-analyzer" },
        },
        nil_ls = {
          cmd = { "nil" }, -- Nix language server
          settings = {
            ['nil'] = {
              formatting = {
                command = { "nixpkgs-fmt" },
              },
            },
          },
        },
        lua_ls = {
          cmd = { "lua-language-server" },
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
        -- Add other servers as needed
      }

      -- Setup each server with configured capabilities
      for server_name, server_settings in pairs(servers) do
        server_settings.capabilities = capabilities
        require('lspconfig')[server_name].setup(server_settings)
      end
    end
  }
}
