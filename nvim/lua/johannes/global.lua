vim.loader.enable()

-- OPTIMIZATIONS --

-- Skip some unused built-in plugins
vim.g.loaded_zipPlugin = true
vim.g.loaded_tarPlugin = true

-- Or advanced matching
vim.g.loaded_matchit = true
vim.g.loaded_remote_plugins = true
vim.g.loaded_2html_plugin = true

-- TODO: Use fzy
-- -- Skip FZF since we use FZY
-- vim.g.loaded_fzf = true

-- Do not load old filetype.vim, use the new filetype.lua
vim.g.do_filetype_lua = true
vim.g.did_load_filetypes = false

-- Disable netrw
vim.g.loaded_netrw = true
vim.g.loaded_netrwSettings = true
vim.g.loaded_netrwPlugin = true
vim.g.loaded_netrwFileHandlers = true

-- Set the leader key to the spacebar
vim.g.mapleader = " "

