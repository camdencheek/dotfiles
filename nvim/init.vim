set nocompatible

call plug#begin('~/.cache/nvim/plugged')
Plug 'morhetz/gruvbox'

Plug 'fatih/vim-go', {'for':'go'}
Plug 'prabirshrestha/async.vim'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'zchee/deoplete-go', {'do': 'make', 'for':'go'}
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'svermeulen/vim-easyclip'
Plug 'zephod/vim-iterm2-navigator'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-slash'


Plug 'mbbill/undotree'
Plug 'haya14busa/incsearch.vim'

Plug 'racer-rust/vim-racer', {'for':'rust'}
Plug 'sebastianmarkow/deoplete-rust', {'for':'rust'}


Plug 'rust-lang/rust.vim', {'for':'rust'}
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}

call plug#end()

" Colorscheme
colorscheme gruvbox
set background=dark
set termguicolors

" Leaders
let mapleader=','
let maplocalleader=','

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
	silent call mkdir(g:data_dir)
endif
if finddir(g:backup_dir) ==# ''
	silent call mkdir(g:backup_dir)
endif
if finddir(g:swap_dir) ==# ''
	silent call mkdir(g:swap_dir)
endif
if finddir(g:undo_dir) ==# ''
	silent call mkdir(g:undo_dir)
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
set foldmethod=indent
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

" Mappings
map <silent> <C-c> <Esc><Esc>:redraw!<cr>

" Python Configuration
"let g:pymode_lint = 0
let g:pymode_virtualenv = 0

" Markdown configuration
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_conceal = 0

" Set filetype to text if unset
autocmd BufEnter * if &filetype == "" | setlocal ft=text | endif

" Set wrapping settings, and remap j to do visually down
set nowrap
autocmd FileType {html,markdown,tex} setlocal wrap
autocmd FileType {html,markdown,tex} nnoremap <expr> j v:count ? 'j' : 'gj'
autocmd FileType {html,markdown,tex} nnoremap <expr> k v:count ? 'k' : 'gk'




" Tex folding
"autocmd FileType {tex} setlocal foldmethod=marker
"autocmd FileType {tex} setlocal foldmarker=%{{{,%}}}
let vimtex_fold_manual = 1

" Beginning and end of line shortcuts
nnoremap H 0
nnoremap L $

" Syntax
if has("syntax")
    syntax on
    filetype on
    au BufNewFile,BufRead *.sage set filetype=python
endif

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#rust#racer_binary='/Users/ccheek/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/Users/ccheek/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src'

let g:deoplete#sources#go#gocode_binary='/Users/ccheek/go/bin/gocode'

" Tab options
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4

" Easy Align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
let g:easy_align_ignore_groups = []

" Easy Clip
let g:EasyClipShareYanks = 1
let g:EasyClipAutoFormat = 1
let g:EasyClipUsePasteDefaults = 0
let g:EasyClipEnableBlackHoleRedirect = 0
let g:EasyClipUsePasteToggleDefaults = 0

" Ctrl-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_prompt_mappings = {
      \ 'PrtSelectMove("j")': ['<c-n>'],
      \ 'PrtSelectMove("k")': ['<c-p>'],
      \ 'PrtHistory(-1)': [],
      \ 'PrtHistory(1)': [],
      \ }

" Vim-go
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

nmap gb :GoBuild<Enter>
nmap gt :GoTest<Enter>

nmap <C-p> :Files<Enter>
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
