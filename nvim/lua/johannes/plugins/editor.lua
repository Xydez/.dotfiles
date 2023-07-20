return {
    -- hop
    {
        "phaazon/hop.nvim",
        version = "2.0.3",
        keys = {
            {
                "<leader>hw",
                function()
                    require("hop").hint_words()
                end,
            }
        },
    },

    -- gitsigns
    "lewis6991/gitsigns.nvim",
}
