-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- LSP navigation keymaps
-- local map = vim.keymap.set
-- local lsp = vim.lsp.buf
--
-- map("n", "gd", lsp.definition, { noremap = true, silent = true, desc = "Go to definition" })
-- map("n", "gi", lsp.implementation, { noremap = true, silent = true, desc = "Go to implementation" })
-- map("n", "gr", lsp.references, { noremap = true, silent = true, desc = "Find references" })

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Copy relative file path to clipboard
vim.keymap.set("n", "<leader>y", function()
  vim.fn.setreg("+", vim.fn.expand("%"))
end, { noremap = true, silent = true, desc = "Copy relative file path to clipboard" })
