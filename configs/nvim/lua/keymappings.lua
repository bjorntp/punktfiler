-- Space as leader
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>qq", ":q!<CR>", { desc = "Force quit" })
vim.keymap.set("n", "<leader>qa", ":qa!<CR>", { desc = "Force quit all" })
vim.keymap.set("n", "<leader>qw", ":wq<CR>", { desc = "Save and quit" })
vim.keymap.set("n", "<leader>qc", "<ESC>", { desc = "Cancel" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save" })

-- Soft move in normal and visual mode
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "j", "gj", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "k", "gk", { noremap = true, silent = true })

-- Move row up and down in normal, insert and visual mode.
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", { noremap = true })
vim.api.nvim_set_keymap("i", "<A-k>", "<ESC>:m .-2<CR>==gi", { noremap = true })
vim.api.nvim_set_keymap("i", "<A-j>", "<ESC>:m .+1<CR>==gi", { noremap = true })
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<cr>gv-gv", { noremap = true })
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true })

-- File explorer
vim.keymap.set("n", "<leader>e", ":Neotree<CR>", { desc = "Explore" })

-- Telescope/search mappings
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
