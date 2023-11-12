local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Integration with git.
	-- Trying out neogit again, but fugitive works pretty okay.
	"tpope/vim-fugitive",
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("diffview").setup()
		end,
	},
	{
		dir = "~/src/gitlinker.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = require("config.gitlinker").config,
	},

	{
		"windwp/nvim-autopairs",
		config = require("config.autopairs").config,
	},

	{
		"kylechui/nvim-surround",
		config = require("config.surround").config,
	},
	{
		"boltlessengineer/smart-tab.nvim",
		config = require("config.smart-tab").config,
	},

	{
		"numToStr/Comment.nvim",
		config = require("config.comment").config,
	},

	-- File browsing
	{
		"nvim-neo-tree/neo-tree.nvim",
		version = "v2.*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = require("config.tree").config,
	},

	-- Allows easy switching between vim and tmux panes
	{
		"mrjones2014/smart-splits.nvim",
		config = require("config.splits").config,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"folke/neodev.nvim",
		},
		config = require("config.lsp").config,
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			-- Use async fzy for telescope because builtin live_grep is slow
			"nvim-telescope/telescope-fzy-native.nvim",
			"nvim-telescope/telescope-fzf-writer.nvim",
			"natecraddock/telescope-zf-native.nvim",

			-- Fuzzy search unicode symbols
			"nvim-telescope/telescope-symbols.nvim",

			-- Git stuff
		},
		lazy = false,
		config = require("config.telescope").config,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = require("config.treesitter").config,
	},
	"nvim-treesitter/playground",

	-- Colorscheme
	{
		"npxbr/gruvbox.nvim",
		dependencies = { "rktjmp/lush.nvim" },
	},

	-- Completion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-cmdline",
		},
		config = require("config.cmp").config,
	},

	-- Snippets
	{
		"l3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
			"benfowler/telescope-luasnip.nvim",
		},
		config = require("config.luasnip").config,
	},

	{
		"nvim-neorg/neorg",
		version = "v5.*",
		build = ":Neorg sync-parsers",
		config = require("config.neorg").config,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},

	{
		"epwalsh/obsidian.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = require("config.obsidian").config,
	},
	{
		"nvimtools/none-ls.nvim",
		config = require("config.none").config,
	},
})
