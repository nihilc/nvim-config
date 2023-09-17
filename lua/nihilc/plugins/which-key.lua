return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		require("which-key").setup({
			window = {
				border = "single", -- none, single, double, shadow
				position = "bottom", -- bottom, top
				margin = { 1, 10, 1, 10 }, -- extra window margin [top, right, bottom, left]
				padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
			},
			layout = {
				height = { min = 5, max = 10 }, -- min and max height of the columns
				width = { min = 25, max = 50 }, -- min and max width of the columns
				spacing = 2, -- spacing between columns
				align = "center", -- align columns left, center or right
			},
			show_help = true,
		})
		require("which-key").register({
			["<leader>"] = {
				f = { name = "Find" },
				h = { name = "Help" },
				t = { name = "Toggle" },
				b = { name = "Buffer" },
				l = { name = "LSP" },
				d = { name = "Debuger" },
			},
		})
	end,
}
