local map = vim.keymap.set

-- Space as leader
vim.g.mapleader = " "
map("n", "<leader>q", "<cmd>confirm q<CR>", { desc = "Quit", silent = true })
map("n", "<leader>w", ":w!<CR>", { desc = "Write", silent = true })

-- Vimwiki
map("n", "<leader>ss", "<cmd>VimwikiIndex<CR>", { desc = "Go back to index", silent = true })
map("n", "<leader>sd", "<cmd>VimwikiMakeDiaryNote<CR>", { desc = "", silent = true })
map("n", "<leader>sn", "<cmd>VimwikiUISelect<CR>", { desc = "", silent = true })
map("n", "<leader>sh", "<cmd>VimwikiAll2HTML<CR>", { desc = "Render HTML pages", silent = true })

-- Always use soft move in normal and visual mode
map("n", "k", "gk", { noremap = true, silent = true })
map("n", "j", "gj", { noremap = true, silent = true })
map("v", "j", "gj", { noremap = true, silent = true })
map("v", "k", "gk", { noremap = true, silent = true })

-- Move row up and down in normal, insert and visual mode.
map("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
map("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
map("i", "<A-k>", "<ESC>:m .-2<CR>==gi", { noremap = true, silent = true })
map("i", "<A-j>", "<ESC>:m .+1<CR>==gi", { noremap = true, silent = true })
map("v", "<A-j>", ":m '>+1<cr>gv-gv", { noremap = true, silent = true })
map("v", "<A-k>", ":m '<-2<cr>gv-gv", { noremap = true, silent = true })

map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })

-- File explorer
map("n", "<leader>e", ":Neotree float<CR>", { desc = "Explore", silent = true })

-- Telescope/search mappings
local builtin = require("telescope.builtin")
map("n", "<leader>fh", builtin.help_tags, { desc = "Search Help" })
map("n", "<leader>fk", builtin.keymaps, { desc = "Search Keymaps" })
map("n", "<leader>ff", builtin.find_files, { desc = "Search Files" })
map("n", "<leader>fs", builtin.builtin, { desc = "Search Select Telescope" })
map("n", "<leader>fw", builtin.grep_string, { desc = "Search current Word" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Search by Grep" })
map("n", "<leader>fd", builtin.diagnostics, { desc = "Search Diagnostics" })
map("n", "<leader>fr", builtin.resume, { desc = "Search Resume" })
map("n", "<leader>f.", builtin.oldfiles, { desc = 'Search Recent Files ("." for repeat)' })

-- Formatting
map({ "n", "v" }, "<leader>cf", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format file or selection", silent = true })

map("n", "<C-CR>", ":lua vim.lsp.buf.code_action()<CR>", { desc = "Fix" })
