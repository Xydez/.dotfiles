return {
    -- project
    {
        "ahmedkhalf/project.nvim",
        -- TODO: Telescope integration: dependencies = { "nvim-telescope/telescope.nvim" },
        opts = {
            patterns = {
                ".git",
                "project.json",
                "Cargo.toml",
            },
        },
        config = function(opts)
            require("project_nvim").setup(opts)
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
        end,
        opts = {
            plugins = {
                registers = false,
            },
        },
    },
    {
        "knubie/vim-kitty-navigator",
        build = (not jit.os:find("Windows"))
            -- Note: The `-r` parameter is non POSIX, so this will only work on GNU ln
            and "ln -sr ./pass_keys.py ~/.config/kitty/ && ln -sr ./neighboring_window.py ~/.config/kitty/"
        or nil,
        init = function()
            vim.g.kitty_navigator_password = "Oje7KNfsupxuUcnZJiJOsvwR"
        end,
    },
    -- harpoon
    --{
    --    "ThePrimeagen/harpoon",
    --    dependencies = { "nvim-lua/plenary.nvim" },
    --    config = function()
    --        local mark = require("harpoon.mark")
    --        local ui = require("harpoon.ui")

    --        vim.keymap.set("n", "<leader>a", mark.add_file)
    --        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

    --        vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
    --        vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
    --        vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
    --        vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
    --    end,
    --},

    -- undotree
    --{
    --    "mbbill/undotree",
    --    config = function()
    --        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    --    end
    --},

    -- lualine.nvim
    --{
    --    "nvim-lualine/lualine.nvim",
    --    opts = {
    --        options = {
    --            icons_enabled = false,
    --            theme = "jellybeans", -- horizon
    --        },
    --    },
    --},
}
