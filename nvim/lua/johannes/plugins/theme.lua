local themes = {
    horizon = {
        "lunarvim/horizon.nvim",
        name = "horizon",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("horizon")
        end,
    },
    horizontransparent = {
        "Xydez/horizontransparent.nvim",
        name = "horizontransparent",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("horizontransparent")

            --vim.api.nvim_set_hl(0, "TabLineFill", { ctermbg = "None" })
            --vim.api.nvim_set_hl(0, "TabLine",     { ctermbg = "None", ctermfg = "Gray" })
            --vim.api.nvim_set_hl(0, "TabLineSel",  { ctermbg = "Blue", ctermfg = "White" })
        end,
    },
    catppuccin = {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            transparent_background = false,
            integration = {
                coc_nvim = true,
                mason = true,
            },
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)

            vim.cmd.colorscheme("catppuccin")
        end,
    },
    kanagawa = {
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        opts = {
            transparent = true,
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = "none"
                        }
                    }
                }
            },
            overrides = function(config)
                -- See: https://github.com/rebelot/kanagawa.nvim/blob/master/lua/kanagawa/themes.lua

                return {
                    NormalFloat = { bg = "none" },
                    FloatBorder = { bg = "none" },
                    FloatTitle = { bg = "none" },

                    CursorLine = { bg = "none" },
                    CursorLineNr = { bg = "none" },
                    --ColorColumn = { bg = config.theme.ui.bg_p1 },

                    TelescopeBorder = { bg = "none" },

                    EndOfBuffer = { fg = config.theme.ui.nontext },

                    -- Save an hlgroup with dark background and dimmed foreground
                    -- so that you can use it where your still want darker windows.
                    -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
                    --NormalDark = { fg = config.theme.ui.fg_dim, bg = "none" },

                    -- Popular plugins that open floats will link to NormalFloat by default;
                    -- set their background accordingly if you wish to keep them dark and borderless
                    --LazyNormal = { fg = config.theme.ui.fg_dim, bg = "none" },
                    --MasonNormal = { fg = config.theme.ui.fg_dim, bg = "none" },
                }
            end
        },
        config = function(_, opts)
            require("kanagawa").setup(opts)

            vim.cmd.colorscheme("kanagawa")
        end,
    },
}

return {
    themes.kanagawa,
}
