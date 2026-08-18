local ts_textobjects_keymaps = {
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
}

-- Note: This is a migration from the old format (master branch of nvim-treesitter and nvim-treesitter-textobjects) to the new one (main branch)
local function setup_keymaps(keymaps)
    for lhs, capture in pairs(keymaps) do
        vim.keymap.set({ "x", "o" }, lhs, function()
            require("nvim-treesitter-textobjects.select").select_textobject(capture, "textobjects")
        end)
    end
end

local ts_textobjects_opts = {
    select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
    },
}

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
    {
        "nvim-treesitter/nvim-treesitter",
        --branch = "main",
        --version = false,
        build = ":TSUpdate",
        lazy = false,
        --event = { "BufReadPost", "BufNewFile" },
        opts = treesitter_opts,
        --config = function(_, opts)
        --    require("nvim-treesitter.configs").setup(opts)
        --end
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
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        --init = function()
        --    vim.g.no_plugin_maps = true
        --end,
        opts = ts_textobjects_opts,
    },

    -- autopairs
    {
        "windwp/nvim-autopairs",
        event = { "BufReadPost", "BufNewFile" },
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
