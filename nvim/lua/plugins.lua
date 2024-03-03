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
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = { indent = { char = "┆" }, scope = { enabled = false } },
	},
	"tpope/vim-fugitive",
	-- {
	-- 	-- Integration with git.
	-- 	-- Trying out neogit again, but fugitive works pretty okay.
	-- 	-- "tpope/vim-fugitive",
	-- 	"NeogitOrg/neogit",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"sindrets/diffview.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 	},
	-- 	config = {},
	-- },
	{
		"sourcegraph/sg.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		config = {},
	},
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = {},
	},
	{
		dir = "~/src/gitlinker.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = require("config.gitlinker").config,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"kylechui/nvim-surround",
		opts = {
			keymaps = {
				change = "cs",
				change_cur = "css",
				visual = "s",
				visual_line = "S",
				delete = "ds",
			},
		},
	},
	{
		"numToStr/Comment.nvim",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = require("config.comment").config,
	},
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
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
			require("config.lsp").config()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
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

			"debugloop/telescope-undo.nvim",
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
	{
		"npxbr/gruvbox.nvim",
		dependencies = { "rktjmp/lush.nvim" },
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-cmdline",
		},
		config = require("config.cmp").config,
	},
	{
		"l3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
			"benfowler/telescope-luasnip.nvim",
		},
		opts = {},
	},
	{
		"nvimtools/none-ls.nvim",
		config = require("config.none").config,
	},
})
