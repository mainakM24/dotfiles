vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/norcalli/nvim-colorizer.lua" },
	{ src = "https://github.com/mason-org/mason.nvim" },
})

require 'mason'.setup()

require 'oil'.setup({
	view_options = {
		show_hidden = true,
	}
})

require 'nvim-web-devicons'.setup()

require 'catppuccin'.setup({
	transparent_background = true,
})

vim.cmd("colorscheme catppuccin-mocha")
vim.lsp.enable({"lua_ls"})

require 'colorizer'.setup()
