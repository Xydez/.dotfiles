local ts_textobjects_keymaps = {
    ["a="] = "@assignment.outer",
    ["i="] = "@assignment.inner",

    ["al"] = "@assignment.lhs",
    ["ar"] = "@assignment.rhs",

    ["af"] = "@function.outer",
    ["if"] = "@function.inner",
    ["ac"] = "@call.outer",
    ["ic"] = "@call.inner",
    ["aa"] = "@parameter.outer",
    ["ia"] = "@parameter.inner",
}

local ts_textobjects_opts = {
    select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
    },
}

local treesitter_opts = {
    ensure_installed = {
        "rust"
    }
}

-- Note: This is a migration from the old format (master branch of nvim-treesitter and nvim-treesitter-textobjects) to the new one (main branch)
local function setup_keymaps(keymaps)
    for lhs, capture in pairs(keymaps) do
        vim.keymap.set({ "x", "o" }, lhs, function()
            require("nvim-treesitter-textobjects.select").select_textobject(capture, "textobjects")
        end)
    end
end

-- Autocommands
local nvimrc_augroup = vim.api.nvim_create_augroup("nvimrc", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    -- See: https://github.com/nvim-treesitter/nvim-treesitter/issues/8424#issuecomment-3744851561
    pattern = {
        "c",
        "cmake",
        "cpp",
        "css",
        "fish",
        "go",
        "graphql",
        "html",
        "java",
        "javascript",
        "javascriptreact",
        "json",
        "ledger",
        "lua",
        "markdown",
        "python",
        "query",
        "rust",
        "toml",
        "tsx",
        "typescript",
        "typescriptreact",
        "vim",
        "vimdoc",
        "vue",
        "yaml",
    },
    callback = function()
        vim.treesitter.start()
    end,
    group = nvimrc_augroup
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascriptreact", "javascript", "vue" },
    callback = function()
        -- Experimental!
        -- Treesitter can manage indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
    group = nvimrc_augroup
})

-- New keymap format migration
setup_keymaps(ts_textobjects_keymaps)

return {
    -- nvim-treesitter (treesitter manager)
    -- TODO: Treesitter has now been added to the neovim core
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        --version = false,
        build = ":TSUpdate",
        lazy = false,
        --event = { "BufReadPost", "BufNewFile" },
        opts = treesitter_opts,
        config = function(_, opts)
            TS = require("nvim-treesitter")
            TS.setup(opts)

            -- Fix now that new main branch of treesitter no longer supports `ensure_installed`
            TS.install(opts.ensure_installed)
        end
    },

    -- playground
    -- TODO: Add command and stuff
    --{
    --    "nvim-treesitter/playground",
    --    -- lazy = true,
    --    dependencies = { "nvim-treesitter/nvim-treesitter" },
    --},

    -- treesitter-textobjects
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        --branch = "main",
        -- event = { "BufReadPost", "BufNewFile" },
        -- dependencies = { "nvim-treesitter/nvim-treesitter" },
        --init = function()
        --    vim.g.no_plugin_maps = true
        --end,
        opts = ts_textobjects_opts,

        branch = "main",
        init = function()
            vim.g.no_plugin_maps = true
        end,
        config = function(opts)
            require("nvim-treesitter-textobjects").setup(opts)

            local function set_map(keybind, textobject, desc)
                vim.keymap.set({"x", "o"}, keybind, function()
                    require("nvim-treesitter-textobjects.select").select_textobject(textobject, "textobjects")
                end, { desc = desc })
            end

            set_map("a=", "@assignment.outer", "outer assignment")
            set_map("i=", "@assignment.inner", "inner assignment")

            set_map("al", "@assignment.lhs", "left hand side of assignment")
            set_map("ir", "@assignment.rhs", "right hand side of assignment")

            set_map("af", "@function.outer", "outer function")
            set_map("if", "@function.inner", "inner function")
            set_map("ac", "@call.outer", "outer call")
            set_map("ic", "@call.inner", "inner call")
            set_map("aa", "@parameter.outer", "outer parameter")
            set_map("ia", "@parameter.inner", "inner parameter")
        end,
    },

    -- autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        --event = { "BufReadPost", "BufNewFile" },
        --dependencies = { "nvim-treesitter/nvim-treesitter" },
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
