return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        branch = 'main',
        build = ':TSUpdate',

        config = function()
            require("nvim-treesitter").install{
                "lua", "go"
            }
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        branch = 'main',

        opts = {
            select = {
                lookahead = true,
                selection_modes = {
                    ['@parameter.outer'] = 'v', -- charwise
                    ['@function.outer'] = 'V', -- linewise
                    ['@class.outer'] = '<c-v>', -- blockwise
                },
                include_surrounding_whitespace = false,
            },
            move = {
                set_jumps = true,
            },
        }
    },
}
