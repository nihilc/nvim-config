local indent_config = {
	["2"] = { "lua", "cpp" },
	["4"] = { "sh", "zsh", "php", "python" },
}

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*" },
	callback = function(args)
		local ft = vim.bo[args.buf].filetype

		for indent, languages in pairs(indent_config) do
			for _, lang in ipairs(languages) do
				if lang == ft then
					vim.opt.shiftwidth = tonumber(indent)
					vim.opt.tabstop = tonumber(indent)
					vim.opt.softtabstop = tonumber(indent)
					return
				end
			end
		end

		-- Default to 2 spaces if no specific configuration is found
		vim.opt.shiftwidth = 2
		vim.opt.tabstop = 2
		vim.opt.softtabstop = 2
	end,
})
