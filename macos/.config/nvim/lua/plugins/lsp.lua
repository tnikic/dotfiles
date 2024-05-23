return {
	-- --------------------------------------------------
	-- Mason
	-- --------------------------------------------------

	{
		"williamboman/mason.nvim",

		config = function()
			require("mason").setup({})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",

		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- Lua
					"lua_ls",
					-- golang
					"gopls",
				},
			})
		end,
	},

	-- --------------------------------------------------
	-- LSP
	-- --------------------------------------------------

	{
		"neovim/nvim-lspconfig",

		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- lua
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			-- golang
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
		end,
	},

	{
		"nvimdev/lspsaga.nvim",

		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			require("lspsaga").setup({
				outline = {
					close_after_jump = true,
				},
			})
		end,
	},
}
