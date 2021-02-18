vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
	-- Packer can manage itself as an optional plugin
	use {'wbthomason/packer.nvim', opt = true}
	use {
		'morhetz/gruvbox',
		'Shougo/deoplete.nvim',
		'tpope/vim-surround',
		'tpope/vim-commentary',
		'tpope/vim-repeat',
		'tpope/vim-fugitive',
		'tpope/vim-rhubarb',
		'preservim/nerdtree',
		'christoomey/vim-tmux-navigator',
		'~/src/sgbrowse',
		'mbbill/undotree',
		'junegunn/vim-easy-align',
		'tjdevries/nlua.nvim',
		{ 'neovim/nvim-lspconfig', commit = "49f64e4" },
		{ 
			'nvim-telescope/telescope.nvim',
			requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
		},
		
		'sheerun/vim-polyglot',

		-- Use polyglot until treesitter syncing issues are fixed
		-- { 
		-- 	'nvim-treesitter/nvim-treesitter', 
		-- 	run = ':TSUpdate' 
		-- },

		-- Maybe replace
		'/usr/local/opt/fzf', -- Telescope
		'junegunn/fzf.vim', -- Telescope
		'jremmen/vim-ripgrep', -- Telescope
		'pbogut/fzf-mru.vim', -- Telescope

		-- Maybe unused plugins
		'svermeulen/vim-yoink',
		'Raimondi/delimitMate',
	}

end)

require('cc/plugins/tmux')
require('cc/plugins/telescope')
require('cc/plugins/nerdtree')
require('cc/plugins/lsp')

-- Disabled until treesitter syncing issues are fixed
-- require('cc/plugins/treesitter')
