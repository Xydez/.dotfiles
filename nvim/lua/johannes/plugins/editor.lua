return {
    -- hop
    -- Keybinds for jumping around in a buffer
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
    --    opts = {},
    --},

    -- NeoColumn.nvim
    -- Show the overflow column only when text trespasses it
    {
        "ecthelionvi/NeoColumn.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            always_on = true,
            NeoColumn = "100",
        },
    },

    -- gitsigns.nvim
    -- Show git changes in the sign column
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {},
    },

    -- -- diffview.nvim
    -- -- Diff extensions
    -- {
    --     "sindrets/diffview.nvim",
    --     event = { "BufReadPost", "BufNewFile" },
    --     opts = {},
    -- },

    -- git-conflict.nvim
    -- Highlight git conflicts
    {
        "akinsho/git-conflict.nvim",
        -- config = true,
        -- event = { "BufReadPost", "BufNewFile" },
        opts = {
            disable_diagnostics = true,
        },
    },

    -- Comment.nvim
    -- Keybinds for commenting out text
    {
        "numToStr/Comment.nvim",
        keys = {
            { "<leader>cl", mode = "v", desc = "Comment out selection (line comment)" },
            { "<leader>cb", mode = "v", desc = "Comment out selection (block comment)" },
        },
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
    -- Highlight key comments
    {
        "folke/todo-comments.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- "folke/trouble.nvim"
        },
        -- TODO: Fix trouble integration
        -- keys = { "<leader>pt", "<CMD>Trouble todos<CR>"},
        opts = {
            highlight = {
                multiline = false,
            },
            -- TODO: Fix icons
            signs = false,
        },
        -- TODO: Fix lazy load
        -- event = { "BufReadPost", "BufNewFile", "BufFilePost" },
    },

    -- colorizer
    -- Set the background color of hex color codes
    {
        "norcalli/nvim-colorizer.lua",
        event = { "BufReadPost", "BufNewFile" },
        opts = {},
    },

    -- sleuth.vim
    -- Heuristically set buffer options (tab vs spaces)
    -- FIXME: Crashes everything, load on wrong event?
    -- {
    --     "tpope/vim-sleuth",
    --     event = { "BufReadPost", "BufNewFile" },
    --     opts = {},
    -- },

    -- dressing.nvim
    -- Improvements to default UI (e.g. input)
    {
        "stevearc/dressing.nvim",
        opts = {},
    },

    -- text_case.nvim
    -- Keybinds start with `ga`
    {
        "johmsalas/text-case.nvim",
        -- event = { "BufReadPost", "BufNewFile", "BufFilePost" }, -- Keys don't really work
        -- keys = {
            -- { mode = { "n", "v" }, "<leader>cs", function() require("textcase").current_word("to_snake_case") end },
            -- { mode = { "n", "v" }, "<leader>cS", function() require("textcase").current_word("to_constant_case") end },
            -- { mode = { "n", "v" }, "<leader>cp", function() require("textcase").current_word("to_pascal_case") end },
            -- { mode = { "n", "v" }, "<leader>cc", function() require("textcase").current_word("to_camel_case") end },
        -- },
        opts = {},
    },

    -- TODO: bufferline.nvim (fancy tabs, groups, etc)
}
