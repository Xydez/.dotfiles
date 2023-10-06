local function find_files()
    require("telescope.builtin").find_files()
end

local function live_grep()
    require("telescope.builtin").live_grep()
end

local function diagnostics()
    require("telescope.builtin").diagnostics()
end

local function buffers()
    require("telescope.builtin").buffers()
end

return {
    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.2",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>pf", find_files },
            --{ "<leader>pg", builtin.git_files },
            --{ "<leader>pp", builtin.grep_string },
            { "<leader>ps", live_grep },
            { "<leader>pd", diagnostics },
            { "<leader>pb", buffers },
        },
    },

    -- vim-fugutive
    {
       "tpope/vim-fugitive",
        lazy = false, -- TODO: Use correct events / commands or something
        keys = {
            { "<leader>gs", vim.cmd.Git, desc = "Open Git view" },
            { "<leader>gb", function() vim.cmd("Git blame") end, desc = "Open Git blame" }
        },
    },
}
