return {
	"jose-elias-alvarez/null-ls.nvim",
	event = "VeryLazy",
	config = function()
		local null_ls = require("null-ls")
		local null_ls_utils = require("null-ls.utils")

		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		local sources = {
			-- LUA
			formatting.stylua,

			-- Bash
			diagnostics.shellcheck,
			formatting.beautysh,

			-- C / CPP
			formatting.clang_format.with({
				extra_args = { "--fallback-style=Google" },
			}),

			-- PHP
			diagnostics.phpcs.with({
				extra_args = { "--standard=PSR12" },
			}),
			formatting.phpcbf.with({
				extra_args = { "--standard=PSR12" },
			}),

			-- JS/TS
			formatting.prettier,
			diagnostics.eslint_d.with({
				condition = function(utils)
					-- only enable if root has .eslintrc.js or .eslintrc.cjs or .eslintrc.json
					return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json" })
				end,
			}),
		}

		null_ls.setup({
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
			sources = sources,
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									--  only use null-ls for formatting instead of lsp server
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		})
	end,
}
