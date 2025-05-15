return {
	{
		"folke/which-key.nvim",
		event = "VimEnter",
		config = function()
			require("which-key").setup()
		end,
		keys = {
			{
				"<leader>f",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Search",
			},
			{
				"<leader>c",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Code related",
			},
		},
	},
}
