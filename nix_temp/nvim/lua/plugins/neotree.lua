return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				filesystem = {
					filtered_items = {
						hide_dotfiles = false,
					},
					-- window = {
					-- 	mappings = {
					-- 		["<CR>"] = "open_nofocus",
					-- 	},
					-- },
					-- commands = {
					-- 	open_nofocus = function(state)
					-- 		require("neo-tree.sources.filesystem.commands").open(state)
					-- 		vim.schedule(function()
					-- 			vim.cmd([[Neotree close]])
					-- 		end)
					-- 	end,
					-- },
				},
			})
		end,
	},
}
