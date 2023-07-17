return function()
    require("nvim-treesitter.configs").setup({
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
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                    ["aa"] = "@parameter.outer",
                    ["ia"] = "@parameter.inner",
                },
            },
        },
    })
end

