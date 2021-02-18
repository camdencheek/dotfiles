set nocompatible

call plug#begin('~/.cache/nvim/plugged')

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'stephpy/vim-yaml'
Plug 'morhetz/gruvbox'
Plug 'Shougo/deoplete.nvim'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'jremmen/vim-ripgrep'
Plug 'christoomey/vim-tmux-navigator'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'mbbill/undotree'
Plug 'svermeulen/vim-yoink'
Plug 'neovim/nvim-lspconfig'
Plug 'Raimondi/delimitMate'
Plug '~/src/sgbrowse'

call plug#end()

" Highlight embedded lua
let g:vimsyn_embed = 'l'

" Colorscheme
colorscheme gruvbox
set background=dark
set termguicolors


" Leaders
let mapleader=','
let maplocalleader=','

" Don't split words on hyphens
set iskeyword+=-

"Line
set cursorline

" Hide cmd
set noshowcmd

" Indent
set autoindent
set smartindent
set cindent

" Show wildmenu
set wildmenu

" Do not break words
set linebreak


" Linenum column
set number

" Backup
set backup
set undofile
set undolevels=1000
let g:data_dir = $HOME . '/.data/'
let g:backup_dir = g:data_dir . 'backup'
let g:swap_dir = g:data_dir . 'swap'
let g:undo_dir = g:data_dir . 'undofile'
if finddir(g:data_dir) ==# ''
"silent call mkdir(g:data_dir)
endif
if finddir(g:backup_dir) ==# ''
"silent call mkdir(g:backup_dir)
endif
if finddir(g:swap_dir) ==# ''
"silent call mkdir(g:swap_dir)
endif
if finddir(g:undo_dir) ==# ''
"silent call mkdir(g:undo_dir)
endif
unlet g:backup_dir
unlet g:swap_dir
unlet g:data_dir
unlet g:undo_dir
set undodir=$HOME/.data/undofile
set backupdir=$HOME/.data/backup
set directory=$HOME/.data/swap

" No fold enable
set nofoldenable
set foldmethod=expr
set foldexpr=nvim_treesitter@foldexpr()
set nowritebackup
set matchtime=0
set ruler
set showmatch
set showmode

" Completion
set completeopt=menu,menuone,longest
set complete=.,w,b,u,t
set pumheight=15
set scrolloff=7

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

" Misc
set laststatus=2
set wildignorecase
set mouse=
set hidden
set ttimeout
set ttimeoutlen=50

" Don't redraw during macro execution
set lazyredraw

" Live substitution
set inccommand=nosplit

" Mappings
nnoremap <C-c> <Esc>
vnoremap <C-c> <Esc>gV
onoremap <C-c> <Esc>
cnoremap <C-c> <C-C><Esc>
inoremap <C-c> <Esc>`^
nnoremap <C-t> :NERDTreeToggleVCS<CR>

" NERDCommenter
let g:NERDSpaceDelims = 1

" Markdown configuration
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_conceal = 2
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_autowrite = 1

" Set filetype to text if unset
autocmd BufEnter * if &filetype == "" | setlocal ft=text | endif

" Deoplete
let g:deoplete#enable_at_startup = 1

" Tab options
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Ctrl-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_prompt_mappings = {
			\ 'PrtSelectMove("j")': ['<c-n>'],
			\ 'PrtSelectMove("k")': ['<c-p>'],
			\ 'PrtHistory(-1)': [],
			\ 'PrtHistory(1)': [],
			\ }


" Tmux
let g:tmux_navigator_no_mappings = 1

noremap <silent> <C-h> <Esc>:TmuxNavigateLeft<cr>
noremap <silent> <C-j> <Esc>:TmuxNavigateDown<cr>
noremap <silent> <C-k> <Esc>:TmuxNavigateUp<cr>
noremap <silent> <C-l> <Esc>:TmuxNavigateRight<cr>
noremap! <silent> <C-h> <Esc>:TmuxNavigateLeft<cr>
noremap! <silent> <C-j> <Esc>:TmuxNavigateDown<cr>
noremap! <silent> <C-k> <Esc>:TmuxNavigateUp<cr>
noremap! <silent> <C-l> <Esc>:TmuxNavigateRight<cr>

nmap <C-p> :Files<Enter>

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, {}, a:fullscreen)
endfunction


nmap <C-g> :RgLive<Enter>
command! -nargs=* -bang RgLive call RipgrepFzf(<q-args>, <bang>0)

command! -bang EditConfig edit ~/.config/nvim/init.vim

let g:fzf_preview_window = []


" Command line shortcuts
cmap <C-f> <Right>
cmap <C-b> <Left>
cnoremap <C-d> <C-f>

" NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Undotree
nmap <C-u> :UndotreeToggle<CR>

" Vim yoink
let g:yoinkSavePersistently = 1

" deoplete settings
call deoplete#custom#option({
            \    'auto_complete_delay': 100,
            \    'max_list': 100,
            \    'min_pattern_length': 1,
            \ })



nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> g?    <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>

set omnifunc=v:lua.vim.lsp.omnifunc
" autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 2000)
" autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 10000)

" delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let b:delimitMate_nesting_quotes = ['`']

" go highlighting
" let g:go_highlight_functions = 1
" let g:go_highlight_function_arguments = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_variable_declarations = 1
" let g:go_highlight_variable_assignments = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_operators = 1
" let g:go_def_mapping_enabled = 0

lua << EOF
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
}
EOF
