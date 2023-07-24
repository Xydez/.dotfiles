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

    -- vim-fugutive
    {
        "tpope/vim-fugitive",
        keys = {
            { "<leader>gs", vim.cmd.Git, desc = "Open Git view" }
        },
    },
}
