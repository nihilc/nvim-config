return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr
			Map({
				n = {
					K = { vim.lsp.buf.hover, "LSP hover", opts },
					gD = { vim.lsp.buf.declaration, "Go to declaration", opts },
					gd = { "<cmd>Telescope lsp_definitions<cr>", "Go LSP definitions", opts },
					gR = { "<cmd>Telescope lsp_references<cr>", "Go LSP references", opts },
					gi = { "<cmd>Telescope lsp_implementations<cr>", "Go LSP implementations", opts },
					gt = { "<cmd>Telescope lsp_type_definitions<cr>", "Go LSP type definitions", opts },
					["[d"] = { vim.diagnostic.goto_prev, "Go to previous diagnostic", opts },
					["]d"] = { vim.diagnostic.goto_next, "Go to next diagnostic", opts },
					["<leader>la"] = { vim.lsp.buf.code_action, "LSP code actions", opts },
					["<leader>lr"] = { vim.lsp.buf.rename, "LSP rename", opts },
					["<leader>lf"] = { vim.lsp.buf.format, "LSP format", opts }, -- autoformat with null-ls
					["<leader>ld"] = { vim.diagnostic.open_float, "Show line diagnostics", opts },
					["<leader>lD"] = { "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics", opts },
				},
			})
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local servers = {
			"html",
			"emmet_ls",
			"cssls",
			"tsserver",

			"bashls",
			"clangd",
			"pyright",
		}
		for _, server in ipairs(servers) do
			lspconfig[server].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		lspconfig["intelephense"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			init_options = {
				globalStoragePath = os.getenv("HOME") .. "/.local/share/intelephense",
			},
		})
	end,
}
