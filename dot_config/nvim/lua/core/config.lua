-- ============================================================================
-- Leaders
-- ============================================================================
vim.g.mapleader = " " -- Set the global <Leader> key to Space
vim.g.maplocalleader = " " -- Set the buffer-local <LocalLeader> key to Space

-- ============================================================================
-- UI / Appearance
-- ============================================================================
vim.g.have_nerd_font = true -- Hint for plugins/UI that a Nerd Font is available

vim.o.number = true -- Show absolute line numbers
vim.o.relativenumber = true -- Show relative line numbers for easier linewise motions
vim.o.signcolumn = "yes" -- Always show the sign column to avoid text shifting
vim.o.showmode = false -- Don't show mode text (statusline typically handles this)
vim.o.cursorline = true -- Highlight the current line
vim.o.scrolloff = 10 -- Keep 10 lines visible above/below the cursor
vim.opt.sidescrolloff = 10 -- Keep 10 columns visible left/right of the cursor

vim.o.list = true -- Render whitespace characters using 'listchars'
vim.opt.listchars = { -- Define how whitespace characters are displayed
	tab = "» ",
	trail = "·",
	nbsp = "␣",
}

vim.o.winborder = "rounded" -- Use rounded borders for floating windows (where supported)

-- ============================================================================
-- Mouse
-- ============================================================================
vim.o.mouse = "a" -- Enable mouse support in all modes

-- ============================================================================
-- Indentation / Tabs
-- ============================================================================
vim.opt.tabstop = 4 -- A literal <Tab> displays as 4 spaces
vim.opt.shiftwidth = 4 -- Indent size used by >>/<< and autoindent is 4 spaces
vim.opt.softtabstop = 4 -- Spaces a <Tab>/<BS> counts for while editing
vim.opt.expandtab = true -- Insert spaces instead of literal tab characters
vim.opt.autoindent = true -- Copy indent from current line when starting a new line
vim.opt.smartindent = true -- Smarter autoindent for some language-like constructs

-- ============================================================================
-- Search
-- ============================================================================
vim.o.ignorecase = true -- Case-insensitive search by default
vim.o.smartcase = true -- ...but case-sensitive if the pattern contains uppercase
vim.o.hlsearch = true -- Highlight matches of the last search
vim.o.incsearch = true -- Show matches while typing the search

-- ============================================================================
-- Splits / Window Management
-- ============================================================================
vim.o.splitright = true -- Put new vertical splits to the right
vim.o.splitbelow = true -- Put new horizontal splits below

-- ============================================================================
-- Timing / Responsiveness
-- ============================================================================
vim.o.updatetime = 250 -- Faster CursorHold/diagnostic updates
vim.o.timeoutlen = 300 -- Time (ms) to wait for a mapped sequence to complete

-- ============================================================================
-- Files / Undo / Prompts
-- ============================================================================
vim.o.undofile = true -- Persist undo history across sessions
vim.o.confirm = true -- Confirm instead of erroring on unsaved/readonly operations
