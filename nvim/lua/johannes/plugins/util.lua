return {
    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
            --vim.keymap.set("n", "<C-p>", builtin.git_files, {})
            --vim.keymap.set("n", "<leader>pp", builtin.grep_string, {})
            vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>d", builtin.diagnostics, {})
        end,
    },

    -- nvim-tree
    -- See: https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt#L309-L546
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        keys = {
            { "<leader>e", vim.cmd.NvimTreeToggle },
        },
        opts = {
            view = {
                number = true,
                relativenumber = true,
            },
            renderer = {
                icons = {
                    show = {
                        file = false,
                        --folder = false,
                        folder_arrow = false,
                        git = false,
                        modified = false,
                    },
                    glyphs = {
                        default = "-",
                        symlink = "S",
                        modified = "M",
                        folder = {
                            default = "+",
                            open = "-",
                        },
                    },
                },
            },
        },
    },

    -- vim-fugutive
    {
        "tpope/vim-fugitive",
        keys = {
            { "<leader>gs", vim.cmd.Git, desc = "Open Git view" }
        },
    },
}
