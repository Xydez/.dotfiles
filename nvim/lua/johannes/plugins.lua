local config_path = "johannes.config."

return {
    -- horizontransparent (theme)
    {
        "Xydez/horizontransparent.nvim",
        name = "horizontransparent",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("horizontransparent")
        end,
    },

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = require(config_path .. "treesitter"),
    },

    -- playground
    "nvim-treesitter/playground",

    -- treesitter-textobjects
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    -- autopairs
    {
        "windwp/nvim-autopairs",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = require(config_path .. "autopairs"),
    },

    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = require(config_path .. "telescope"),
    },

    -- harpoon
    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = require(config_path .. "harpoon"),
    },

    -- undotree
    {
        "mbbill/undotree",
        config = require(config_path .. "undotree"),
    },

    -- top
    {
        "phaazon/hop.nvim",
        version = "2.0.3",
        config = require(config_path .. "hop"),
    },

    -- tree
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        config = require(config_path .. "tree"),
        --dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional (NOTE: Not supported in Alacritty?)
    },

    -- fugutive
    {
        "tpope/vim-fugitive",
        config = require(config_path .. "fugitive"),
    },

    -- gitsigns
    {
        "lewis6991/gitsigns.nvim",
        config = require(config_path .. "gitsigns"),
    },

    -- LSP
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            -- LSP Support
            "neovim/nvim-lspconfig",                -- Required
            {                                       -- Optional
                "williamboman/mason.nvim",
                build = ":MasonUpdate",
            },
            "williamboman/mason-lspconfig.nvim",    -- Optional

            -- Autocompletion
            "hrsh7th/nvim-cmp",                     -- Required
            "hrsh7th/cmp-nvim-lsp",                 -- Required
            "L3MON4D3/LuaSnip",                     -- Required
        },
        config = require(config_path .. "lsp-zero"),
    },
}

