-- Leader key
-- Set leader key before loading plugins so that the defined
-- keybindings are correct
vim.g.mapleader      = ','
vim.g.maplocalleader = ','

require('cc/plugins')
require('cc/notes')

local opt = vim.opt

-- Misc options
opt.equalalways    = true -- Auto-resize windows
opt.hidden         = true
opt.laststatus     = 2
opt.lazyredraw     = true
opt.mouse          = 'n'
opt.ruler          = true
opt.showcmd        = false
opt.ttimeout       = true
opt.ttimeoutlen    = 50
opt.wildignorecase = true
opt.wildmenu       = true
opt.scrolloff      = 7
opt.sidescrolloff  = 7
opt.cursorline     = true
opt.linebreak      = true
opt.number         = true
opt.wrap           = false

-- Colorscheme
opt.background    = 'dark'
opt.termguicolors = true
vim.cmd([[
	au ColorScheme * hi Normal ctermbg=none guibg=none
	colorscheme gruvbox
]])

-- Indentation
opt.autoindent  = true
opt.autoindent  = true
opt.cindent     = true
opt.cindent     = true
opt.tabstop     = 4
opt.tabstop     = 4
opt.softtabstop = 4
opt.softtabstop = 4
opt.shiftwidth  = 4
opt.shiftwidth  = 4
opt.expandtab   = false
opt.expandtab   = false

-- Backup and undo
opt.backup         = true
opt.undofile       = true
opt.undolevels     = 1000
local data_dir   = '/Users/camdencheek/.data/'
opt.backupdir      = data_dir .. 'backup'
opt.undodir        = data_dir .. 'undofile'
opt.directory      = data_dir .. 'swap'

-- Folding
opt.foldenable    = true
opt.foldmethod    = 'expr'
opt.foldexpr      = 'nvim_treesitter#foldexpr()'
opt.foldlevel     = 20

-- Completion
-- o.completeopt    = 'menuone,noselect'
-- o.complete       = '.,w,b,u,t'
opt.pumheight      = 15

-- Search
opt.incsearch      = true
opt.hlsearch       = true
opt.ignorecase     = true
opt.smartcase      = true
opt.inccommand     = 'nosplit'

-- Clipboard
opt.clipboard      = '' -- don't use system clipboard

-- Formatting
opt.formatoptions  = 'cqrnj'

-- Splitting
opt.splitright     = true
opt.splitbelow     = true
