local config_path = "johannes.plugins.config."

return {
    {
        "Xydez/horizontransparent.nvim",
        name = "horizontransparent",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("horizontransparent")
        end,
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = require(config_path .. "treesitter"),
    },

    "nvim-treesitter/playground",

    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    {
        "windwp/nvim-autopairs",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = require(config_path .. "autopairs"),
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = require(config_path .. "telescope"),
    },

    -- Harpoon
    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = require(config_path .. "harpoon"),
    },

    -- Undotree
    {
        "mbbill/undotree",
        config = require(config_path .. "undotree"),
    },

    -- Hop
    {
        "phaazon/hop.nvim",
        version = "2.0.3",
        config = require(config_path .. "hop"),
    },

    -- nvim-tree
    --{
    --    "nvim-tree/nvim-tree.lua",
    --    lazy = false,
    --    --dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional
    --},

    -- Fugutive
    {
        "tpope/vim-fugitive",
        config = require(config_path .. "fugitive"),
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

