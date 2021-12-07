vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
	-- Packer can manage itself as an optional plugin
	use {'wbthomason/packer.nvim', opt = true}
	use {
		'junegunn/vim-easy-align',
		'tjdevries/nlua.nvim',
		-- 'tpope/vim-fugitive',
		-- 'TimUntersberger/neogit',

		-- javascript
		'maxmellon/vim-jsx-pretty',
		'pangloss/vim-javascript',

		'tpope/vim-surround',

		-- Trying lua plugin
		'b3nj5m1n/kommentary',

		-- File browsing
		-- nvim-tree is working pretty well, can probably remove this soon
		'kyazdani42/nvim-web-devicons',
		'kyazdani42/nvim-tree.lua',

		-- Allows easy switching between vim and kitty panes
		{
			'knubie/vim-kitty-navigator',
			run = 'cp ./*.py ~/.config/kitty/'
		},

		-- Custom plugin for opening in sourcegraph
		'~/src/sgbrowse',

		-- Autoclose
		-- 'steelsojka/pears.nvim',
		'windwp/nvim-autopairs',

		-- LSP
		-- '~/src/nvim-lspconfig',
		'neovim/nvim-lspconfig',
		'nvim-lua/plenary.nvim',
		'nvim-lua/popup.nvim',
		'nvim-telescope/telescope.nvim',
		'folke/lsp-trouble.nvim',

		-- Use async fzy for telescope because builtin live_grep is slow
		'nvim-telescope/telescope-fzy-native.nvim',
		'nvim-telescope/telescope-fzf-writer.nvim',

		-- Fuzzy search unicode symbols
		'nvim-telescope/telescope-symbols.nvim',

		{
			'nvim-treesitter/nvim-treesitter',
			-- '~/src/nvim-treesitter',
			run = ':TSUpdate'
		},
		'nvim-treesitter/playground',
		'nvim-treesitter/nvim-treesitter-textobjects',

		-- Colorscheme
		{"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}},
	}
end)

pcall(require('cc/plugins/fzf'))
pcall(require('cc/plugins/kommentary'))
pcall(require('cc/plugins/lsp'))
pcall(require('cc/plugins/telescope'))
pcall(require('cc/plugins/tree'))
pcall(require('cc/plugins/treesitter'))
require('nvim-autopairs').setup({
	disable_filetype = { "TelescopePrompt" , "vim" },
})
-- local neogit = require('neogit')
-- neogit.setup {
-- 	kind = "split"
-- }
-- vim.api.nvim_set_keymap('n', '<leader>gg',':Neogit kind=split<CR>', {})

local npairs = require('nvim-autopairs')

-- skip it, if you use another global object
_G.MUtils= {}

MUtils.completion_confirm=function()
	if vim.fn.pumvisible() ~= 0  then
		return npairs.esc("<cr>")
	else
		return npairs.autopairs_cr()
	end
end


vim.api.nvim_set_keymap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
