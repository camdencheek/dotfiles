vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
	-- Packer can manage itself as an optional plugin
	use {'wbthomason/packer.nvim', opt = true}
	use {
		'junegunn/vim-easy-align',
		'mbbill/undotree',
		'morhetz/gruvbox',
		'tjdevries/nlua.nvim',
		'tpope/vim-fugitive',
		'tpope/vim-repeat',
		'tpope/vim-rhubarb',
		'tpope/vim-surround',

		-- Trying lua plugin
		-- 'tpope/vim-commentary',
		'b3nj5m1n/kommentary',

		-- File browsing
		-- 'preservim/nerdtree',
		'kyazdani42/nvim-web-devicons',
		'kyazdani42/nvim-tree.lua',

		-- Allows easy switching between vim and tmux panes
		'christoomey/vim-tmux-navigator',

		-- Custom plugin for opening in sourcegraph
		'~/src/sgbrowse',

		'nvim-lua/completion-nvim',
		-- Compe worked alright, but the default mappings were causing issues
		-- 'hrsh7th/nvim-compe',

		-- Autoclose
		'steelsojka/pears.nvim',
		-- 'windwp/nvim-autopairs',

		-- LSP
		'neovim/nvim-lspconfig',
		{
			'nvim-telescope/telescope.nvim',
			requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
		},
		'folke/lsp-trouble.nvim',

		-- Use async fzy for telescope because builtin live_grep is slow
		'nvim-telescope/telescope-fzy-native.nvim',
		'nvim-telescope/telescope-fzf-writer.nvim',

		-- Treesitter is good enough, but still has a number of unsupported
		-- languages and breaks a lot.
		-- 'sheerun/vim-polyglot',
		{
			'nvim-treesitter/nvim-treesitter',
			-- '~/src/nvim-treesitter',
			run = ':TSUpdate'
		},
	}
end)

pcall(require('cc/plugins/fzf'))
pcall(require('cc/plugins/kommentary'))
pcall(require('cc/plugins/lsp'))
pcall(require('cc/plugins/telescope'))
pcall(require('cc/plugins/tmux'))
pcall(require('cc/plugins/tree'))
pcall(require('cc/plugins/treesitter'))
pcall(require('cc/plugins/pears'))

