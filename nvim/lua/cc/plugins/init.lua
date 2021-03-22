vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
	-- Packer can manage itself as an optional plugin
	use {'wbthomason/packer.nvim', opt = true}
	use {
		'tpope/vim-surround',
		'tpope/vim-repeat',
		'tpope/vim-fugitive',
		'tpope/vim-rhubarb',
		'mbbill/undotree',
		'junegunn/vim-easy-align',
		'tjdevries/nlua.nvim',
		'pwntester/octo.nvim',

		-- Trying lua plugin
		-- 'tpope/vim-commentary',
		'b3nj5m1n/kommentary',

		-- File browsing
		-- 'preservim/nerdtree',
		'kyazdani42/nvim-web-devicons',
		'kyazdani42/nvim-tree.lua',

		-- Allows easy switching between vim and tmux panes
		'christoomey/vim-tmux-navigator',

		-- Highlights and adds command to strip whitespace
		'ntpeters/vim-better-whitespace',

		-- Custom plugin for opening in sourcegraph
		'~/src/sgbrowse',

		-- Compe worked alright, but the default mappings were causing issues
		'nvim-lua/completion-nvim',
		-- 'hrsh7th/nvim-compe',

		'norcalli/snippets.nvim',

		-- Autoclose
		'cohama/lexima.vim',

		-- LSP
		'neovim/nvim-lspconfig',
		{
			'nvim-telescope/telescope.nvim',
			requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
		},

		-- Use async fzy for telescope because builtin live_grep is slow
		'nvim-telescope/telescope-fzy-native.nvim',
		'nvim-telescope/telescope-fzf-writer.nvim',


		-- The nvim gruvbox theme didn't work quite how I like it, but it might
		-- have just been bad setup on my part
		-- {
		-- 	"npxbr/gruvbox.nvim",
		-- 	requires = { "rktjmp/lush.nvim" },
		-- },
		'morhetz/gruvbox',


		-- Treesitter is good enough, but still has a number of unsupported
		-- languages and breaks a lot.
		-- 'sheerun/vim-polyglot',
		{
			'nvim-treesitter/nvim-treesitter',
			run = ':TSUpdate'
		},
	}
end)

pcall(require('cc/plugins/tmux'))
pcall(require('cc/plugins/fzf'))
pcall(require('cc/plugins/telescope'))
pcall(require('cc/plugins/lsp'))
pcall(require('cc/plugins/treesitter'))
pcall(require('cc/plugins/tree'))
pcall(require('cc/plugins/kommentary'))
