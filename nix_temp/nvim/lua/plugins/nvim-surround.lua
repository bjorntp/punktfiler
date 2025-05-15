return {
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- keymaps = {
				-- 	normal = "<Space>sy",
				-- 	normal_cur = "<Space>sl",
				-- 	normal_line = "<Space>sY",
				-- 	visual = "<Space>sS",
				-- 	visual_line = "<Space>sg",
				-- 	delete = "<Space>sd",
				-- 	change = "<Space>sc",
				-- 	change_line = "<Space>sC",
				-- },
			})
		end,
	},
}
