-- Shortcut for netrw
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

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

-- Tab shortcuts
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>")
vim.keymap.set("n", "<leader>tm", ":tabmove")
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>")

-- Window shortcuts
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "+", "`")

