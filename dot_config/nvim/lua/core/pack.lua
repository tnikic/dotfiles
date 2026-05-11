-- Plugin installation (vim.pack)
vim.pack.add({
	-- UI
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },

	-- Navigation / picker / file management
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/echasnovski/mini.nvim" },

	-- LSP / tooling
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },

	-- Completion
	{
		src = "https://github.com/Saghen/blink.cmp",
		version = vim.version.range("1.*"),
	},

	-- AI
	{ src = "https://github.com/zbirenbaum/copilot.lua" },
	{ src = "https://github.com/fang2hou/blink-copilot" },

	-- Syntax
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
})

-- Plugin configuration
require("plugins.tokyonight")
require("plugins.lualine")

require("plugins.oil")
require("plugins.fzf")
require("plugins.snacks")
require("plugins.mini")
require("plugins.nvim-treesitter")

require("plugins.mason")
require("plugins.conform")
require("plugins.copilot")
require("plugins.blink")
