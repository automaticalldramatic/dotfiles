-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Show hidden files and folders in netrw explorer
vim.g.netrw_hide = 0 -- 0 = show hidden files, 1 = hide hidden files
vim.g.netrw_list_hide = "" -- clear any hide patterns

-- Indentation and tab display settings
vim.opt.tabstop = 4 -- Display tabs as 4 spaces wide
vim.opt.shiftwidth = 1 -- Keep 1 tab per indentation level (Go convention)
vim.opt.expandtab = false -- Use tabs, not spaces
vim.opt.softtabstop = 4 -- Make backspace delete 4 spaces worth of tab
