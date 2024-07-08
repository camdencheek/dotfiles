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
		"vhyrro/luarocks.nvim",
		priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
		config = true,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = { indent = { char = "┆" }, scope = { enabled = false } },
	},
	"tpope/vim-fugitive",
	{
		"SuperBo/fugit2.nvim",
		opts = {
			width = 70,
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
			"nvim-lua/plenary.nvim",
			{
				"chrisgrieser/nvim-tinygit", -- optional: for Github PR view
				dependencies = { "stevearc/dressing.nvim" },
			},
		},
		cmd = { "Fugit2", "Fugit2Diff", "Fugit2Graph" },
		keys = {
			{ "<leader>F", mode = "n", "<cmd>Fugit2<cr>" },
		},
	},
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
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
		-- dir = "~/src/nvim-treesitter",
		build = ":TSUpdate",
		config = require("config.treesitter").config,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.gruvbox_material_enable_italic = false
			vim.g.gruvbox_material_enable_bold = true
			vim.g.gruvbox_material_foreground = "original"
			vim.cmd.colorscheme("gruvbox-material")
		end,
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
	require("config.bookmarks"),
	{
		"jiaoshijie/undotree",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("undotree").setup({
				float_diff = true,  -- using float window previews diff, set this `true` will disable layout option
				layout = "left_bottom", -- "left_bottom", "left_left_bottom"
				position = "left",  -- "right", "bottom"
				ignore_filetype = {
					"undotree",
					"undotreeDiff",
					"qf",
					"TelescopePrompt",
					"spectre_panel",
					"tsplayground",
				},
				window = {
					winblend = 0,
				},
				keymaps = {
					["j"] = "move_next",
					["k"] = "move_prev",
					["gj"] = "move2parent",
					["J"] = "move_change_next",
					["K"] = "move_change_prev",
					["<cr>"] = "action_enter",
					["p"] = "enter_diffbuf",
					["<C-c>"] = "quit",
				},
			})
			vim.keymap.set("n", "<C-u>", require("undotree").toggle)
		end,
	},
})
