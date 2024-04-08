return {
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
}
