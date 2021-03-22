-- Leader key
-- Set leader key before loading plugins so that the defined
-- keybindings are correct
vim.g.mapleader      = ','
vim.g.maplocalleader = ','

require('cc/plugins')
require('cc/notes')

local wo = vim.wo
local o = vim.o
local bo = vim.bo

-- Misc options
o.iskeyword      = o.iskeyword .. '-'
wo.cursorline    = true
o.showcmd        = false
o.wildmenu       = true
wo.linebreak     = true
wo.number        = true
o.ruler          = true
wo.scrolloff     = 7
o.laststatus     = 2
o.wildignorecase = true
o.mouse          = 'n'
o.hidden         = true
o.ttimeout       = true
o.ttimeoutlen    = 50
o.lazyredraw     = true
wo.wrap          = false
o.equalalways    = true -- Auto-resize windows

-- Colorscheme
vim.cmd([[colorscheme gruvbox]])
o.background     = 'dark'
o.termguicolors  = true

-- Indentation
o.autoindent     = true
o.smartindent    = true
o.cindent        = true
o.tabstop        = 4
bo.tabstop        = 4
o.softtabstop    = 4
o.shiftwidth     = 4
o.expandtab      = false

-- Backup and undo
o.backup         = true
o.undofile       = true
o.undolevels     = 1000

data_dir         = '/Users/ccheek/.data/'
o.backupdir      = data_dir .. 'backup'
o.undodir        = data_dir .. 'undofile'
o.directory      = data_dir .. 'swap'

-- Folding
wo.foldenable    = true
wo.foldmethod    = 'expr'
wo.foldexpr      = 'nvim_treesitter#foldexpr()'
wo.foldlevel     = 20

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
o.clipboard      = 'unnamedplus'

-- Formatting
o.formatoptions  = 'cqrnj'

-- Splitting
o.splitright     = true
o.splitbelow     = true

-- Go highlighting
vim.g.go_highlight_functions             = 1
vim.g.go_highlight_function_arguments    = 1
vim.g.go_highlight_function_calls        = 1
vim.g.go_highlight_types                 = 1
vim.g.go_highlight_fields                = 1
vim.g.go_highlight_variable_declarations = 1
vim.g.go_highlight_variable_assignments  = 1
vim.g.go_highlight_extra_types           = 1
vim.g.go_highlight_operators             = 1
vim.g.go_def_mapping_enabled             = 0

