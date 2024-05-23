local opts = { noremap = true, silent = true }

-- --------------------------------------------------
-- LSP
-- --------------------------------------------------

vim.keymap.set("n", "gh", ":Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "gd", ":Lspsaga goto_definition<CR>", opts)
vim.keymap.set("n", "gt", ":Lspsaga goto_type_definition<CR>", opts)
vim.keymap.set("n", "gf", ":Lspsaga finder<CR>", opts)
vim.keymap.set("n", "gr", ":Lspsaga rename<CR>", opts)
vim.keymap.set("n", "go", ":Lspsaga outline<CR>", opts)

-- --------------------------------------------------
-- Telescope
-- --------------------------------------------------

vim.keymap.set("n", "ff", require("telescope.builtin").find_files, {})
vim.keymap.set("n", "fg", require("telescope.builtin").live_grep, {})
vim.keymap.set("n", "fb", require("telescope.builtin").buffers, {})

-- --------------------------------------------------
-- File Explorer
-- --------------------------------------------------

vim.keymap.set("n", "<leader>n", ":Neotree toggle focus left<CR>", {})
