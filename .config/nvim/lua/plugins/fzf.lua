require("fzf-lua").setup()

local key = vim.keymap.set

-- Files and Buffers
key("n", "<leader>ff", "<cmd>FzfLua files<cr>")
key("n", "<leader>fb", "<cmd>FzfLua buffers<cr>")

-- LSP
key("n", "<leader>gr", "<cmd>FzfLua lsp_references<cr>")
key("n", "<leader>gd", "<cmd>FzfLua lsp_definitions<cr>")
key("n", "<leader>gi", "<cmd>FzfLua lsp_implementations<cr>")
key("n", "<leader>ca", "<cmd>FzfLua lsp_code_action<cr>")
key("n", "<leader>da", "<cmd>FzfLua diagnostics_workspace<cr>")
