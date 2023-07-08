return function()
    local hop = require("hop")
    --local direction = require("hop.hint").HintDirection

    hop.setup({})

    -- See https://github.com/phaazon/hop.nvim/wiki/Advanced-Hop

    vim.keymap.set("n", "<leader>hw", function()
        hop.hint_words()
    end)

    --vim.keymap.set("n", "<leader>hc", function()
    --    hop.hint_char1()
    --end)
end

