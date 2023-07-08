-- Set the leader key to the spacebar
vim.g.mapleader = " "

-- Shortcut for netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move the selected text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- J cursor stays in place
vim.keymap.set("n", "J", "mzJ`z")

-- Half page jumping keeps the cursor in the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Add comma at the end and then create a new line
vim.keymap.set("n", "<leader>o", "A,<Esc>o")
vim.keymap.set("n", "<leader>O", "A,<Esc>O")

