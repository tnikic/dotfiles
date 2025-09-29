require("snacks").setup({
	lazygit = {},
	indent = {},
})

-- Lazygit
vim.keymap.set("n", "<leader>gg", function()
	Snacks.lazygit()
end)
