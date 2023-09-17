return {
	"williamboman/mason.nvim",
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"jayp0521/mason-null-ls.nvim",
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_null_ls = require("mason-null-ls")
		local mason_nvim_dap = require("mason-nvim-dap")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				-- Web
				"html", -- html
				"emmet_ls", -- html
				"cssls", -- css
				"tsserver", -- js/ts
				"intelephense", -- php

				"lua_ls", -- lua
				"bashls", -- bash
				"clangd", -- c/cpp
				"pyright", -- python
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_null_ls.setup({
			-- list of formatters & linters for mason to install
			ensure_installed = {
				"stylua", -- lua formatter
				"shellcheck", -- bash linter
				"beautysh", -- bash linter
				"cpplint", -- c/cpp formatter
				"cland-format", -- c/cpp formatter
				"phpcs", -- php linter
				"phpcbf", -- php formater
				"prettier", -- js/ts formatter
				"eslint_d", -- js/ts linter
			},
			-- auto-install configured servers
			automatic_installation = true,
		})

		mason_nvim_dap.setup({
			ensure_installed = {
				"codelldb", -- c/cpp debuger
			},
			-- auto-install configured servers
			automatic_installation = true,
		})
	end,
}
