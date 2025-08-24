vim.g.mapleader = " "

vim.keymap.set("n", "-", ":Oil<CR>")
vim.keymap.set("n", "<leader>cd", ":Ex<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set("n", "<leader>wq", ":wq<CR>")
vim.keymap.set("n", "<leader>fb", ":FzfLua buffers<CR>")
vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>")

vim.keymap.set("n", "<Esc>", ":noh<CR>")
vim.keymap.set("n", "<C-/>", "0x")
vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("n", "<leader>get", ":lua vim.print(vim.pack.get())<CR>")
