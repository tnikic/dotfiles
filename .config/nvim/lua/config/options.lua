-- Leader
vim.g.mapleader = " "

-- Relative Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Global Undo
vim.opt.undofile = true

-- Window Split
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.breakindent = true

-- Smart Tabs
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Visuals
vim.opt.cursorline = true
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 10
-- vim.opt.cmdheight = 0
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
