vim.pack.add({
	-- Dependencies
	{ src = "https://github.com/nvim-tree/nvim-web-devicons.git" },
	-- LSP
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim.git" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim.git" },
	{ src = "https://github.com/stevearc/conform.nvim.git" },
	{
		src = "https://github.com/Saghen/blink.cmp.git",
		version = vim.version.range("1.*"),
	},
	{ src = "https://github.com/zbirenbaum/copilot.lua.git" },
	{ src = "https://github.com/fang2hou/blink-copilot.git" },
	-- Utilities
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim.git" },
	{ src = "https://github.com/ibhagwan/fzf-lua.git" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim.git" },
	{ src = "https://github.com/folke/snacks.nvim.git" },
	{ src = "https://github.com/echasnovski/mini.nvim.git" },
	-- Treesitter
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
})

require("plugins.tokyonight")
require("plugins.oil")
require("plugins.fzf")
require("plugins.lualine")
require("plugins.snacks")
require("plugins.mini")

require("plugins.mason")
require("plugins.conform")
require("plugins.copilot")
require("plugins.blink")

require("plugins.nvim-treesitter")
