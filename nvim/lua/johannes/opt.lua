vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop     = 4 -- Width of tab character
-- vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4
vim.opt.expandtab = true

-- vim.opt.autoindent = true
-- vim.opt.smartindent = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.cursorline = true

vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.completeopt = "menuone,noselect"

-- Allow editing binary files without mangling to UTF-8
vim.opt.binary = true
vim.opt.display:append("uhex") -- Show invalid unicode characters as hex

-- vim.opt.signcolumn = "number"

vim.opt.list = true -- Show tabs, line-breaks, trailing spaces, end of line
vim.opt.listchars = { nbsp = "¬" , tab = "▸ ", trail = "·" , precedes = "«", extends = "»" }

vim.opt.ignorecase = true
vim.opt.smartcase = true
