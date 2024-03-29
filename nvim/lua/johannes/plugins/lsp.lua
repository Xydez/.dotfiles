local function lsp_zero_config()
    local lsp = require("lsp-zero").preset()

    require("neodev").setup({})

    lsp.ensure_installed({
        "tsserver",
        "lua_ls",
        "rust_analyzer"
    })

    local cmp = require("cmp")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local cmp_mappings = lsp.defaults.cmp_mappings({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-s>"] = cmp.mapping.confirm({ select = true }),
        -- ["<C-space>"] = cmp.mapping.complete(),
    })

    lsp.set_preferences({
        sign_icons = {}
    })

    lsp.setup_nvim_cmp({
        mapping = cmp_mappings
    })

    lsp.on_attach(function(_, bufnr)
        local opts = { buffer = bufnr, remap = false }

        -- lsp.default_keymaps({buffer = bufnr})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        -- vim.keymap.set("n", "gD", function()
        --     vim.cmd("vsplit")
        --     vim.lsp.buf.definition({ reuse_win = true })
        -- end, opts)
        vim.keymap.set("n", "<leader>tg", "<C-w><C-]><C-w>T", opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol(vim.fn.input("Query: ")) end, opts)
        vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float(nil, { focusable = false }) end, opts)
        --vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        --vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vr", function() require("telescope.builtin").lsp_references() end, opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

        --vim.keymap.set("n", "<leader>vf", function() vim.lsp.foldmethod() end, opts)
    end)

    local lsp_config = require("lspconfig")

    lsp_config.lua_ls.setup(lsp.nvim_lua_ls())
    lsp_config.tsserver.setup({
        filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
        cmd = { "typescript-language-server", "--stdio" },
    })
    lsp_config.psalm.setup({
        cmd = { "x", "psalm", "--language-server" },
        flags = { debounce_text_changes = 150 },
    })
    -- lsp_config.phpactor.setup({})
    --lsp_config.rust_analyzer.setup({})
    lsp_config.hls.setup({
        filetypes = { "haskell", "lhaskell", "cabal" }
    })

    lsp.setup()

    require("rust-tools").setup({
        server = lsp.build_options("rust_analyzer", {})
    })

    vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = true, -- See `lsp_lines`

        underline = true,
        float = {
            -- See https://neovim.io/doc/user/api.html#api-win_config
            border = "rounded",
            source = "always",
        },
    })

    -- Show diagnostic on hover
    --vim.api.nvim_set_option("updatetime", 300) -- set updatetime for CursorHold
    --vim.api.nvim_create_autocmd("CursorHold", {
    --    pattern = "*",
    --    callback = function()
    --        vim.diagnostic.open_float(nil, { focusable = false })
    --    end,
    --})

    -- Format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.rs",
        callback = function()
            vim.lsp.buf.format({ async = true })
        end,
    })
end

return {
    -- lsp-zero
    {
        "VonHeikemen/lsp-zero.nvim",
        event = { "BufReadPost", "BufNewFile" },
        branch = "v2.x",
        dependencies = {
            -- LSP Support
            "neovim/nvim-lspconfig",                -- Required
            {                                       -- Optional
                "williamboman/mason-lspconfig.nvim",
                dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
            },
            {                                       -- Optional
                "williamboman/mason.nvim",
                cmd = "Mason",
                build = ":MasonUpdate",
                config = function(opts)
                    require("mason").setup(opts)
                end,
            },
            -- Autocompletion
            "hrsh7th/nvim-cmp",                     -- Required
            "hrsh7th/cmp-nvim-lsp",                 -- Required
            "L3MON4D3/LuaSnip",                     -- Required

            -- neodev.nvim
            "folke/neodev.nvim",
        },
        config = lsp_zero_config,
    },

    -- cmp
    -- { "hrsh7th/nvim-cmp" },

    -- TODO: Add snippets, see https://github.com/L3MON4D3/LuaSnip#add-snippets
    -- LuaSnip
    -- Snippets
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = (not jit.os:find("Windows"))
            -- NOTE: jsregexp is optional, so not a big deal if it fails to build
            and "make install_jsregexp"
        or nil,
        opts = {},
        keys = {
            -- TODO: Setup keys
            { "<C-k>", function() require("luasnip").expand() end, mode = "i" },
        },
    },

    -- rust-tools.nvim
    {
        "simrat39/rust-tools.nvim",
        event = "LspAttach",
        dependencies = { "neovim/nvim-lspconfig" },
    },

    -- vim-kitty
    {
        "fladson/vim-kitty",
        event = "LspAttach",
    },

    -- fidget.nvim
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        opts = {
            text = {
                spinner = "dots",
            },
            window = {
                blend = 0,
            },
        },
    },

    -- {
    --     "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    --     dependencies = {
    --         "neovim/nvim-lspconfig",
    --     },
    --     config = function()
    --         require("lsp_lines").setup()
    --     end,
    -- },
}
