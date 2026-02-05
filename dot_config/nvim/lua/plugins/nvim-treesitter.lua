local fts = { "regex", "go", "python", "templ", "lua" }

require("nvim-treesitter").install(fts)

vim.api.nvim_create_autocmd("FileType", {
	pattern = fts,
	callback = function()
		vim.treesitter.start()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
