--options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
vim.opt.winborder = "rounded"

--keymaps
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set("n", "<leader>wq", ":wq<CR>")
vim.keymap.set("n", "<leader>e", ":Ex<CR>")
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "[", ":bprev<CR>")
vim.keymap.set("n", "]", ":bnext<CR>")
vim.keymap.set("n", "<Esc>", ":noh<CR>")
vim.keymap.set("n", "-", ":Oil<CR>")
vim.keymap.set("v", "q", "c\"<Esc>pa\"<Esc>", {desc = "surround selected code with quotes \" "} ) 

--plugins
vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/catppuccin/nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons"
})

--setups
require "mason".setup()
require ("oil").setup()

--lsp
vim.lsp.enable({"gopls" , "lua_ls"})

--color
vim.cmd("colorscheme catppuccin-mocha")
