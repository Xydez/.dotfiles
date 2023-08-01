return {
    -- hop
    --{
    --    "phaazon/hop.nvim",
    --    version = "2.0.3",
    --    keys = {
    --        {
    --            "<leader>hw",
    --            function()
    --                require("hop").hint_words()
    --            end,
    --        }
    --    },
    --},

    -- NeoColumn.nvim
    {
        "ecthelionvi/NeoColumn.nvim",
        event = "BufEnter",
        opts = {
            always_on = true,
            NeoColumn = "100",
        },
    },

    -- gitsigns.nvim
    {
        "lewis6991/gitsigns.nvim",
        event = "BufEnter",
    },

    -- Comment.nvim
    {
        "numToStr/Comment.nvim",
        event = "BufEnter",
        opts = {
            ignore = "^$",
            toggler = {
                line = nil,
                block = nil,
            },
            opleader = {
                line = "<leader>cl",
                block = "<leader>cb",
            },
            mappings = {
                basic = true,
                extra = false,
            },
        },
    },

    -- todo-comments.nvim
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = true,
    }
}
