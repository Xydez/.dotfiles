local telescope = {}

function telescope.find_files()
    require("telescope.builtin").find_files()
end

function telescope.live_grep()
    require("telescope.builtin").live_grep()
end

function telescope.diagnostics()
    require("telescope.builtin").diagnostics()
end

function telescope.buffers()
    require("telescope.builtin").buffers()
end

local trouble = {}

function trouble.toggle()
    require("trouble").toggle()
end

return {
    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.2",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            defaults = {
                -- path_display = { "smart" }, -- smart, shorten
                layout_strategy = "vertical",
                layout_config = {
                  vertical = {
                    width = function(_, max_columns)
                        return max_columns - 8
                    end,
                    -- prompt_position = "top",
                    -- mirror = true,
                  },
                },
            },
        },
        keys = {
            { "<leader>pf", telescope.find_files, desc = "Toggle Telescope find files" },
            --{ "<leader>pg", builtin.git_files },
            --{ "<leader>pp", builtin.grep_string },
            { "<leader>ps", telescope.live_grep, desc = "Toggle Telescope live grep" },
            -- { "<leader>pd", telescope.diagnostics },
            { "<leader>pb", telescope.buffers, desc = "Toggle Telescope buffers" },
        },
    },

    -- trouble
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        -- dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "<leader>pd", trouble.toggle, desc = "Toggle trouble.nvim" }
        },
        opts = {
            position = "right",
            icons = false,
        },
    },

    -- vim-fugutive
    {
        "tpope/vim-fugitive",
        cmd = "Git",
        keys = {
            { "<leader>gs", vim.cmd.Git, desc = "Open Git view" },
            { "<leader>gb", function() vim.cmd("Git blame") end, desc = "Open Git blame" }
        },
    },
}
