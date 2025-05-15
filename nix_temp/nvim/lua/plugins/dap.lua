return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
			vim.keymap.set("n", "<space>gb", dap.run_to_cursor)
			vim.keymap.set("n", "<F5>", dap.continue)
			vim.keymap.set("n", "<F10>", dap.step_over)
			vim.keymap.set("n", "<F11>", dap.step_into)
			vim.keymap.set("n", "<F12>", dap.step_out)
			vim.keymap.set("n", "<F6>", dap.restart)

			require("dapui").setup()

			dap.adapters.java = function(callback, config)
				callback({
					type = "server",
					host = "127.0.0.1",
					port = 5005,
				})
			end
			-- dap.configurations.java = {
			-- 	{
			-- 		type = "java",
			-- 		request = "attach",
			-- 		name = "Debug Java",
			-- 		hostname = "127.0.0.1",
			-- 		port = 5005,
			-- 	},
			-- }

			-- Define the debug configuration
			dap.configurations.java = {
				{
					classPaths = {},
					type = "java",
					javaexec = "/usr/lib/jvm/java-23-openjdk/bin/java",
					mainClass = "com.aoc.AocSolutionApplication",
					request = "attach",
					name = "Debug Spring Boot App",
					hostName = "127.0.0.1",
					port = 5005,
				},
			}
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		config = function()
			require("dap-python").setup("python3")
		end,
	},
}
