-- Diagnostics
vim.diagnostic.config({
	virtual_text = false,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

-- Native LSP
vim.lsp.enable({ "lua_ls", "gopls", "templ", "pyright" })
