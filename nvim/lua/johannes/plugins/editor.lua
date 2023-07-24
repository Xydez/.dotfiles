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
        },
    },

    -- gitsigns
    {
        "lewis6991/gitsigns.nvim",
        event = "BufEnter",
    },
}
