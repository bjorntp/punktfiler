-- Space as leader
vim.g.mapleader = ' '
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "quit"})
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "save"})

-- Telescope and short cuts
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "find files"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "live grep"})
vim.keymap.set('n', '<leader>f', "<Nop>", { desc = "Telescope"})

-- Ranger
vim.api.nvim_set_keymap('n', '<leader>e', ':RnvimrToggle<CR>', { desc = "explore"})

-- Soft move in normal and visual mode
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'k', 'gk', { noremap = true, silent = true })

-- Move row up and down in normal, insert and visual mode.
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', {noremap = true})
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', {noremap = true})
vim.api.nvim_set_keymap('i', '<A-k>', '<ESC>:m .-2<CR>==gi', {noremap = true})
vim.api.nvim_set_keymap('i', '<A-j>', '<ESC>:m .+1<CR>==gi', {noremap = true})
vim.api.nvim_set_keymap('v', '<A-j>', ":m '>+1<cr>gv-gv", {noremap = true})
vim.api.nvim_set_keymap('v', '<A-k>', ":m '<-2<cr>gv-gv", {noremap = true})

-- Lazygit
-- vim.api.nvim_set_keymap('n', '<leader>l', ":LazyGit<CR>", {desc = "LazyGit", noremap = true})

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>ra', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>rr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>rl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
