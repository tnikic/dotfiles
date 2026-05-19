require("blink.cmp").setup({
	keymap = {
		preset = "default",
		["<C-k>"] = { "select_prev", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },

		["<tab>"] = { "accept", "fallback" },
	},

	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
		},
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	signature = { enabled = true },
})
