vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.opt.signcolumn = "yes"
vim.opt.number = true

vim.g.mapleader = " "

vim.keymap.set("n", "<c-h>", ":wincmd h<cr>", { noremap = true })
vim.keymap.set("n", "<c-j>", ":wincmd j<cr>", { noremap = true })
vim.keymap.set("n", "<c-k>", ":wincmd k<cr>", { noremap = true })
vim.keymap.set("n", "<c-l>", ":wincmd l<cr>", { noremap = true })
