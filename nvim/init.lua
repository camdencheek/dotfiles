-- Leader key
-- Set leader key before loading plugins so that the defined
-- keybindings are correct
vim.g.mapleader      = ','
vim.g.maplocalleader = ','

require('cc/plugins')
require('cc/notes')

local w = vim.wo
local o = vim.o
local b = vim.bo

-- Misc options
o.equalalways    = true -- Auto-resize windows
o.hidden         = true
o.laststatus     = 2
o.lazyredraw     = true
o.mouse          = 'n'
o.ruler          = true
o.showcmd        = false
o.ttimeout       = true
o.ttimeoutlen    = 50
o.wildignorecase = true
o.wildmenu       = true
o.scrolloff      = 7
o.sidescrolloff  = 7
w.cursorline     = true
w.linebreak      = true
w.number         = true
w.wrap           = false

-- Colorscheme
vim.cmd([[colorscheme gruvbox]])
o.background    = 'dark'
o.termguicolors = true

-- Indentation
o.autoindent  = true
b.autoindent  = true
o.cindent     = true
b.cindent     = true
o.tabstop     = 4
b.tabstop     = 4
o.softtabstop = 4
b.softtabstop = 4
o.shiftwidth  = 4
b.shiftwidth  = 4
o.expandtab   = false
b.expandtab   = false

-- Backup and undo
o.backup         = true
o.undofile       = true
o.undolevels     = 1000
local data_dir   = '/Users/ccheek/.data/'
o.backupdir      = data_dir .. 'backup'
o.undodir        = data_dir .. 'undofile'
o.directory      = data_dir .. 'swap'

-- Folding
w.foldenable    = true
w.foldmethod    = 'expr'
w.foldexpr      = 'nvim_treesitter#foldexpr()'
w.foldlevel     = 20

-- Completion
o.completeopt    = 'menuone,noselect'
o.complete       = '.,w,b,u,t'
o.pumheight      = 15

-- Search
o.incsearch      = true
o.hlsearch       = true
o.ignorecase     = true
o.smartcase      = true
o.inccommand     = 'nosplit'

-- Clipboard
o.clipboard      = '' -- don't use system clipboard

-- Formatting
o.formatoptions  = 'cqrnj'

-- Splitting
o.splitright     = true
o.splitbelow     = true
