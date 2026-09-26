-- Rubya Akter Badhon

local map = vim.keymap.set
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
map("n", "<leader>w", ":w<CR>", { desc = "Save" })
map("n", "<leader>e", ":Ex<CR>", { desc = "File explorer" })
