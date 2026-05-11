require("fzf-lua").setup()
require("fzf-lua").register_ui_select()

local key = vim.keymap.set

key("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Files" })
key("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "Buffers" })
key("n", "<leader>fs", "<cmd>FzfLua live_grep<CR>", { desc = "Live grep" })
key("n", "<leader>fh", "<cmd>FzfLua help_tags<CR>", { desc = "Help tags" })
key("n", "<leader>fd", "<cmd>FzfLua diagnostics_workspace<CR>", { desc = "Workspace diagnostics" })
