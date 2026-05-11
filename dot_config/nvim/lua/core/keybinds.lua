-- Search / UI
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Basics
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Write file" })

-- Native LSP
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
		end

		map("K", vim.lsp.buf.hover, "LSP: Hover documentation")
		map("<leader>rn", vim.lsp.buf.rename, "LSP: Rename symbol")
		map("gd", vim.lsp.buf.definition, "LSP: Go to definition")
		map("gr", vim.lsp.buf.references, "LSP: Go to references")
		map("<leader>ca", vim.lsp.buf.code_action, "LSP: Code action")
		map("gD", vim.lsp.buf.declaration, "LSP: Go to declaration")
		map("gi", vim.lsp.buf.implementation, "LSP: Go to implementation")
	end,
})
