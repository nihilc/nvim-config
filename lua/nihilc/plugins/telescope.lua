return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "(F)ind (F)ile",
			},
			{
				"<leader>fw",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "(F)ind (W)ord",
			},
			{
				"<leader>fb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "(F)ind (B)uffer",
			},
			{
				"<leader>ht",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "(H)elp (T)ags",
			},
			{
				"<leader>hk",
				function()
					require("telescope.builtin").keymaps()
				end,
				desc = "(H)elp (K)eymaps",
			},
			{
				"<leader>tt",
				function()
					require("telescope.builtin").builtin()
				end,
				desc = "(T)oggle (T)Telescope",
			},
		},
		-- TODO config interface
		-- opts = {}
	},
}
