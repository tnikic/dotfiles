require("mason").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"gopls",
		"templ",
		"golangci-lint",
		"pyright",
		"prettierd",
		"lua-language-server",
		"stylua",
	},
})
