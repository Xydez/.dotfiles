local function find_files()
    require("telescope.builtin").find_files()
end

local function live_grep()
    require("telescope.builtin").live_grep()
end

local function diagnostics()
    require("telescope.builtin").diagnostics()
end

return {
    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.2",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>pf", find_files },
            --{ "<C-p>", builtin.git_files },
            --{ "<leader>pp", builtin.grep_string },
            { "<leader>ps", live_grep },
            { "<leader>d", diagnostics },
        },
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
            hijack_cursor = true,
            hijack_unnamed_buffer_when_opening = true,
            respect_buf_cwd = true,
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
            view = {
                number = true,
                relativenumber = true,
                side = "right",
                width = 50,
                centralize_selection = true,
            },
            renderer = {
                add_trailing = true,
                group_empty = true,
                highlight_opened_files = "name",
                highlight_modified = "name",
                indent_markers = {
                    enable = true,
                },
                icons = {
                    show = {
                        file = false,
                        folder = false,
                        folder_arrow = false,
                        git = false,
                        modified = false,
                    },
                    --glyphs = {
                    --    default = "-",
                    --    symlink = "S",
                    --    modified = "M",
                    --    folder = {
                    --        default = "+",
                    --        open = "-",
                    --    },
                    --},
                },
            },
            tab = {
                sync = {
                    open = true,
                    close = true,
                },
            },
        },
        config = function(_, opts)
            require("nvim-tree").setup(opts)

            vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = function(_) -- data
                local api = require("nvim-tree.api")

                api.tree.open()
            end})
        end,
    },

    -- vim-fugutive
    {
        "tpope/vim-fugitive",
        keys = {
            { "<leader>gs", vim.cmd.Git, desc = "Open Git view" }
        },
    },
}
