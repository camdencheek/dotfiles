" Plugin manager

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdcommenter'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'klen/python-mode'
Plug 'tpope/vim-surround'
Plug 'rip-rip/clang_complete'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'lervag/vimtex'
Plug 'rhysd/vim-grammarous'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-repeat'
Plug 'freitass/todo.txt-vim'

call plug#end()

set mouse=

set timeout timeoutlen=300 ttimeoutlen=200

let mapleader = ","
let g:mapleader = ","
let maplocalleader = ','

" Disable completion docs buffer
set completeopt-=preview

" Change window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Relative line number
set relativenumber

" Syntax Highlighting
syntax on 
colorscheme desert

filetype plugin indent on 
set tabstop=4
set shiftwidth=4
set smarttab

" Sneak
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S
xmap f <Plug>Sneak_s
xmap F <Plug>Sneak_S
omap f <Plug>Sneak_s
omap F <Plug>Sneak_S

" Set Statusline
set laststatus=2
set statusline=%.20f
set statusline+=\ %l/%L
set statusline+=:%c

" Searchtasks
let g:tlTokenList = ['TODO','FIXME']

" Pymode
let g:pymode_doc = 0
let g:pymode_doc_bind=''
let g:pymode_lint_on_fly = 1
let g:pymode_lint_ignore = "E501,E231,E225,E262,E251,E261,E302"
let g:pymode_lint_cwindow = 0

"" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#disable_auto_complete = 1

"Clang Complete
let g:clang_library_path='/usr/lib/libclang.so.3.9'

" Disable completion on tex files
autocmd BufEnter *.tex :call deoplete#disable()
" Wrap at words on tex files
autocmd BufEnter *.tex :set wrap linebreak
" Spell check tex files
autocmd BufReadPre *.tex :set spell

" Undofile
set undofile
set undodir=~/.vim/undodir
if has('persistent_undo')
    set rtp+=~/configit/vim/modules/undotree
    nnoremap <silent> <Space>u :UndotreeToggle<CR>
    let g:undotree_SetFocusWhenToggle = 1
    set undofile
    set undodir=~/.undodir/
    set undolevels=1000
    set undoreload=10000
endif

" Undotree
nnoremap <C-u> :UndotreeToggle<cr>

" undotree window width
if !exists('g:undotree_SplitWidth')
    let g:undotree_SplitWidth = 30
endif

" NerdCommenter settings
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
map <leader>/ <Plug>NERDCommenterInvert

"Vim Latex settings
let g:tex_comment_nospell=1

" Reload
nmap <leader>vr :source ~/.vimrc<cr>

" Search Options
set hlsearch
set ignorecase
set smartcase

" Clear trailing whitespace in selected file types on save
autocmd BufWritePre *.py,*.js,*.hs,*.html,*.css,*.scss :%s/\s\+$//e
