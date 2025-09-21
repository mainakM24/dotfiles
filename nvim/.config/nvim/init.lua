--options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
vim.opt.winborder = "rounded"
vim.opt.completeopt = { "menuone", "popup", "noinsert" }
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
--vim.opt.showtabline = 2

--keymaps
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set("n", "<leader>wq", ":wq<CR>")
vim.keymap.set("n", "<leader>e", ":Ex<CR>")
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>")
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<Esc>", ":noh<CR>")
vim.keymap.set("n", "-", ":Oil<CR>")
vim.keymap.set("v", "q", "c\"<Esc>pa\"<Esc>", { desc = "surround selected code with quotes \" " })
vim.keymap.set("n", "<leader>fb", ":FzfLua buffers<CR>")
vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>")
vim.keymap.set("n", "<leader>r", vim.lsp.buf.format)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")


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
    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/Saghen/blink.cmp"
})

--color
vim.cmd("colorscheme catppuccin-mocha")

--setups
require "oil".setup({ view_options = { show_hidden = true } })
require "mason".setup()
require "mason-lspconfig".setup()
require "blink.cmp".setup({
    fuzzy = { implementation = "lua" },
    keymap = { preset = "enter" },
    completion = { list = { selection = { preselect = true, auto_insert = false } }, trigger = { show_on_insert = false } }
})
require "nvim-treesitter.configs".setup({
    ensure_installed = {"c", "cpp", "html", "javascript"},
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
	enable = true,
	keymaps = {
	    init_selection = "<leader>ss",
	    node_incremental = "<leader>si",
	    scope_incremental = "<leader>sc",
	    node_decremental = "<leader>sd",
	},
    },
})

--lsp
require "mason-tool-installer".setup({
    ensure_installed = { "lua_ls", "html", "cssls" }
})

