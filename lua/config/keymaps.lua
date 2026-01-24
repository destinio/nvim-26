vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>rr", "<CMD>restart<CR>", { desc = "Restart NeoVim" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open Quickfix" })

vim.keymap.set("n", "-", ":Ex<cr>", { desc = "Explore" })
