vim.cmd([[packadd packer.nvim]])

require("packer").startup(function()
	local use = use
	-- Packer can manage itself as an optional plugin
	use({ "wbthomason/packer.nvim", opt = true })
	use({
		"jbyuki/one-small-step-for-vimkind",
		"junegunn/vim-easy-align",
		"tjdevries/nlua.nvim",
		"~/src/gitlinker.nvim",
		"tpope/vim-fugitive",

		-- javascript
		"maxmellon/vim-jsx-pretty",
		"pangloss/vim-javascript",

		"tpope/vim-surround",

		"b3nj5m1n/kommentary",

		-- File browsing
		"kyazdani42/nvim-tree.lua",
		"kyazdani42/nvim-web-devicons",

		-- Allows easy switching between vim and kitty panes
		"christoomey/vim-tmux-navigator",

		-- Custom plugin for opening in sourcegraph
		-- '~/src/sgbrowse',

		-- LSP
		-- '~/src/nvim-lspconfig',
		"neovim/nvim-lspconfig",
		"nvim-lua/plenary.nvim",
		"nvim-lua/popup.nvim",
		"nvim-telescope/telescope.nvim",
		-- 'folke/lsp-trouble.nvim',
		"mhartington/formatter.nvim",

		-- Use async fzy for telescope because builtin live_grep is slow
		"nvim-telescope/telescope-fzy-native.nvim",
		"nvim-telescope/telescope-fzf-writer.nvim",

		-- Fuzzy search unicode symbols
		"nvim-telescope/telescope-symbols.nvim",

		{
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		},
		"nvim-treesitter/playground",

		-- Colorscheme
		{ "npxbr/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } },

		{
			"nvim-neorg/neorg",
			branch = "main",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-neorg/neorg-telescope",
			},
		},

		-- Completion
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"onsails/lspkind.nvim",

		-- Snippets
		"l3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		"saadparwaiz1/cmp_luasnip",

		-- DAP
		"mfussenegger/nvim-dap",
		{ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } },

		-- Rust setup
		{
			"simrat39/rust-tools.nvim",
			branch = "modularize_and_inlay_rewrite",
			requires = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },
		},
	})
end)

pcall(require("cc/plugins/kommentary"))
pcall(require("cc/plugins/lsp"))
pcall(require("cc/plugins/formatter"))
pcall(require("cc/plugins/telescope"))
pcall(require("cc/plugins/tree"))
pcall(require("cc/plugins/treesitter"))
pcall(require("cc/plugins/gitlinker"))
pcall(require("cc/plugins/neorg"))
pcall(require("cc/plugins/dap"))
pcall(require("cc/plugins/cmp"))
require("luasnip.loaders.from_vscode").lazy_load({
	path = { "/Users/camdencheek/.local/share/nvim/site/pack/packer/start/friendly-snippets" },
})

local extension_path = "/Users/camdencheek/.vscode/extensions/vadimcn.vscode-lldb-1.7.3/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

require("rust-tools").setup({
	server = {
		cmd = { "rustup", "run", "nightly", "rust-analyzer" },
		standalone = false,
	},
	dap = {
		adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
	},
})
