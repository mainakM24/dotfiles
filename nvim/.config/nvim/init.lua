--options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
vim.opt.winborder = "rounded"
vim.opt.completeopt = { "menu", "popup", "noselect" }

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
vim.keymap.set("v", "q", "c\"<Esc>pa\"<Esc>", { desc = "surround selected code with quotes \" " })
vim.keymap.set("n", "<leader>fb", ":FzfLua buffers<CR>")
vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>")
vim.keymap.set("n", "<leader>r", vim.lsp.buf.format)

--plugins
vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/catppuccin/nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/ibhagwan/fzf-lua"
})

--setups
require "mason".setup()
require "mason-lspconfig".setup()
require "mason-tool-installer".setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
		"gopls",
		"html"
	}
})
require 'oil'.setup({
	view_options = {
		show_hidden = true,
	}
})


--color
vim.cmd("colorscheme catppuccin-mocha")
