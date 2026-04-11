-- Add `lazy`
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.runtimepath:prepend(vim.env.LAZY or lazypath)

-- Setup `lazy`
require("lazy").setup("johannes.plugins", {
    change_detection = {
        notify = false,
    },
    defaults = {
        lazy = false,
        --version = false
    },
    -- install = { colorscheme = { "tokyonight" } },
    -- checker = { enabled = true },
    ui = {
        icons = {
              cmd = "⌘",
              config = "🛠",
              event = "📅",
              ft = " ",
              init = "⚙",
              keys = "🗝",
              plugin = "🔌",
              runtime = "💻",
              require = "🌙",
              source = "",
              start = "🚀",
              task = "✔",
              lazy = "💤 ",
        },
    },

    -- disable luarocks to fix warning
    rocks = {
        enabled = false,
    },
})

