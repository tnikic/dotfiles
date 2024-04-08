return {
    {
        "nvimtools/none-ls.nvim",

        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.gofumpt,
                    null_ls.builtins.formatting.goimports_reviser,
                },
            })

            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",

        config = function()
            require("mason-null-ls").setup({
                ensure_installed = {
                    -- lua
                    "stylua",
                    -- golang
                    "gofumpt", "goimports-reviser",
                },
            })
        end,
    },
}
