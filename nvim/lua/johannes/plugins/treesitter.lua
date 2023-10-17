local treesitter_opts = {
    -- A list of parser names, or "all"
    ensure_installed = {
        "c",
        "css",
        "fish",
        "graphql",
        "html",
        "json",
        "lua",
        "rust",
        "tsx",
        "toml",
        "vim",
        "vimdoc",
        "query",
        "yaml",
    },

    sync_install = false,
    auto_install = true,

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        additional_vim_regex_highlighting = false,
    },

    indent = {
        enable = true,
        disable = {},
    },

    -- See https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                ["a="] = "@assignment.outer",
                ["i="] = "@assignment.inner",

                -- TODO: These two are kind of wack
                ["al"] = "@assignment.lhs",
                ["ar"] = "@assignment.rhs",

                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@call.outer",
                ["ic"] = "@call.inner",
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
            },
        },
    },
    -- incremental_selection = {
    --     enable = false,
    --     keymaps = {
    --         init_selection = "<C-space>",
    --         node_incremental = "<C-space>",
    --         scope_incremental = false,
    --         node_decremental = "<bs>"
    --     },
    -- }
}

return {
    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        --version = false,
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        opts = treesitter_opts,
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end
    },

    -- playground
    {
        "nvim-treesitter/playground",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    -- treesitter-textobjects
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    -- autopairs
    {
        "windwp/nvim-autopairs",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            check_ts = true,
        },
        config = function(_, opts)
            local autopairs = require("nvim-autopairs")

            autopairs.setup(opts)
            autopairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
        end
    },
}
