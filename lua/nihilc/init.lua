-- Setup options
require("nihilc.configs.options")

-- Setup keymaps
require("nihilc.configs.keymaps")

-- Setup autocmd
require("nihilc.configs.autocmd")

-- Setup plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "nihilc.plugins" }, { import = "nihilc.plugins.lsp" } }, {
	install = {
		colorscheme = { "catppuccin", "habamax" },
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})

vim.cmd("colorscheme catppuccin")
