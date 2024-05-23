return {
	{
		"catppuccin/nvim",
		name = "catppuccin",

		config = function()
			vim.cmd.colorscheme("catppuccin-macchiato")
		end,
	},

	{
		"github/copilot.vim",
	},

	{
		"lewis6991/gitsigns.nvim",

		config = function()
			require("gitsigns").setup()
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",

		config = function()
			require("ibl").setup()
		end,
	},

	{
		"windwp/nvim-autopairs",

		config = function()
			require("nvim-autopairs").setup()
		end,
	},

	{
		"christoomey/vim-tmux-navigator",

		vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { noremap = true, silent = true }),
		vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", { noremap = true, silent = true }),
		vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", { noremap = true, silent = true }),
		vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { noremap = true, silent = true }),
	},
}
