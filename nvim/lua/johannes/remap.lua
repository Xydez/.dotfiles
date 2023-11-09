-- Shortcut for netrw
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move the selected text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- J cursor stays in place
vim.keymap.set("n", "J", "mzJ`z")

-- Half page jumping keeps the cursor in the middle of the screen
-- TODO: For some reason these seem to cause lag (?)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Add comma at the end and then create a new line
vim.keymap.set("n", "<leader>o", "A,<Esc>o")
vim.keymap.set("n", "<leader>O", "A,<Esc>O")

-- Tab shortcuts
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>")
vim.keymap.set("n", "<leader>tm", ":tabmove")
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>")

for i = 1, 9, 1 do
    vim.keymap.set("n", "<leader>" .. i, i .. "gt")
end

-- Window shortcuts
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-x>", "<C-w>x")

-- vim.keymap.set("n", "<C-H>", "<C-w>H")
-- vim.keymap.set("n", "<C-J>", "<C-w>J")
-- vim.keymap.set("n", "<C-K>", "<C-w>K")
-- vim.keymap.set("n", "<C-L>", "<C-w>L")

-- Go to mark using `+`
vim.keymap.set("n", "+", "`")

-- Snippets (keybinds are prefixed `<leader>s`)
vim.keymap.set("n", "<leader>ss", ":r!echo -n $(git config --get user.name) \\<$(git config --get user.email)\\> at $(date '+\\%Y-\\%m-\\%d')<CR><CR>") -- s = signature (username and date)
