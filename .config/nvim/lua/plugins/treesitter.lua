return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = {"lua"},
                sync_install = false,
                auto_install = false,
                highlight = {enable = true},
                indent = {enable = true},

                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<Enter>",
                        node_incremental = "<Enter>",
                        scope_incremental = false,
                        node_decremental = "<Backspace>",
                    },
                },
            }
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require'nvim-treesitter.configs'.setup {
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,

                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner"
                        },

                        selection_modes = {
                            ['@function.outer'] = 'V',
                            ['@class.outer'] = '<c-v>',
                        },

                        include_surrounding_whitespace = true,
                    },

                    swap = {
                        enable = true,
                        swap_next = { ["<leader>a"] = "@parameter.inner" },
                        swap_previous = { ["<leader>A"] = "@parameter.inner" },
                    },

                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            ["]f"] = "@function.outer",
                            ["]c"] = "@class.outer",
                        },
                        goto_next_end = {
                            ["]M"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[m"] = "@function.outer",
                            ["[["] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[M"] = "@function.outer",
                            ["[]"] = "@class.outer",
                        },
                        -- Below will go to either the start or the end, whichever is closer.
                        -- Use if you want more granular movements
                        -- Make it even more gradual by adding multiple queries and regex.
                        goto_next = {
                            ["]d"] = "@conditional.outer",
                        },
                        goto_previous = {
                            ["[d"] = "@conditional.outer",
                        }
                    },
                },
            }
        end
    },
}
