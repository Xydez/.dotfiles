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
            transparent = false,
        },
        config = function(_, opts)
            require("kanagawa").setup(opts)

            vim.cmd.colorscheme("kanagawa")
        end,
    },
}

return {
    themes.horizon,
}
