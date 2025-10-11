-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>tc", "<cmd>Coverage<cr>", { desc = "Show Coverage" })
vim.keymap.set("n", "<leader>th", "<cmd>CoverageHide<cr>", { desc = "Hide Coverage" })
