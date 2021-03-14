vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
	-- Packer can manage itself as an optional plugin
	use {'wbthomason/packer.nvim', opt = true}
	use {
		'tpope/vim-surround',
		'tpope/vim-commentary',
		'tpope/vim-repeat',
		'tpope/vim-fugitive',
		'tpope/vim-rhubarb',
		'ntpeters/vim-better-whitespace',
		'preservim/nerdtree',
		'christoomey/vim-tmux-navigator',
		'~/src/sgbrowse',
		'mbbill/undotree',
		'junegunn/vim-easy-align',
		'tjdevries/nlua.nvim',
		-- 'hrsh7th/nvim-compe',
		'cohama/lexima.vim',
		-- 'Shougo/deoplete.nvim',
		{ 'neovim/nvim-lspconfig', commit = "49f64e4" },
		'vijaymarupudi/nvim-fzf',
		'vijaymarupudi/nvim-fzf-commands',
		'Raimondi/delimitMate',
		-- Disabled until it's a bit more stable
		{ 
			'nvim-telescope/telescope.nvim',
			requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
		},
		'nvim-telescope/telescope-fzy-native.nvim',
		'nvim-telescope/telescope-fzf-writer.nvim',
		-- {
		-- 	"npxbr/gruvbox.nvim",
		-- 	requires = { "rktjmp/lush.nvim" },
		-- },
		'morhetz/gruvbox',
		

		-- Use polyglot until treesitter syncing issues are fixed
		-- 'sheerun/vim-polyglot',
		{ 
			'nvim-treesitter/nvim-treesitter', 
			run = ':TSUpdate' 
		},

		-- Maybe replace
		-- '/usr/local/opt/fzf', -- Telescope
		-- 'junegunn/fzf.vim', -- Telescope
		-- 'jremmen/vim-ripgrep', -- Telescope
		-- 'pbogut/fzf-mru.vim', -- Telescope

		-- Maybe unused plugins
		'svermeulen/vim-yoink',
	}

end)

require('cc/plugins/tmux')
require('cc/plugins/fzf')
require('cc/plugins/telescope')
require('cc/plugins/nerdtree')
require('cc/plugins/lsp')
-- require('cc/plugins/compe')

-- Disabled until treesitter syncing issues are fixed
require('cc/plugins/treesitter')
