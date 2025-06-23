vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
				missing_parameters = false,
			},
		},
	},
})
