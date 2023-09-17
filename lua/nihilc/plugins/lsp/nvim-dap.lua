return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	config = function()
		local dap = require("dap")

		-- Mappings
		Map({
			n = {
				["[b"] = {
					function()
						dap.list_breakpoints()
						vim.cmd("cnext")
					end,
					"Previous breakpoint",
				},
				["]b"] = {
					function()
						dap.list_breakpoints()
						vim.cmd("cprev")
					end,
					"Next breakpoint",
				},
				["<F5>"] = { "<cmd>DapContinue<cr>", "Debuger start/continue" },
				["<F6>"] = { "<cmd>DapTerminate<cr>", "Debuger start/continue" },
				["<F09>"] = {
					function()
						dap.step_back()
					end,
					"Debuger step back",
				},
				["<F10>"] = {
					function()
						dap.step_over()
					end,
					"Debuger step over",
				},
				["<F11>"] = {
					function()
						dap.step_into()
					end,
					"Debuger step into function/method",
				},
				["<F12>"] = {
					function()
						dap.step_out()
					end,
					"Debuger step out function/method",
				},
				["<leader>db"] = {
					function()
						dap.toggle_breakpoint()
					end,
					"Debuger breakpoint",
				},
				["<leader>dB"] = {
					function()
						vim.ui.input({ prompt = "Log point message" }, function(input)
							dap.toggle_breakpoint(nil, nil, input)
						end)
					end,
					"Debuger breakpoint log message",
				},
			},
		})

		-- Adapters
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
				args = { "--port", "${port}" },
			},
		}

		-- Lang configurations
		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}
	end,
}
