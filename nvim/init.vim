set nocompatible

" Python bin setup
let g:python_host_prog='/usr/bin/python2.7'
let g:python3_host_prog='/usr/bin/python3.6'
let g:pymode_rope = 0

" Setup dein  ---------------------------------------------------------------{{{
if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
	call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
	call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
endif


set runtimepath+=~/.config/nvim/autoload/dein.vim
call dein#begin(expand('~/.config/nvim'))
call dein#add('Shougo/dein.vim')
call dein#add('christoomey/vim-tmux-navigator')

" Autocompletion
" call dein#add('Shougo/neocomplete',        { 'on_i' : 1, 'loadconf' : 1, })
call dein#add('Shougo/neco-syntax',        { 'on_i' : 1})
call dein#add('ujihisa/neco-look',         { 'on_i' : 1})
call dein#add('Shougo/neoinclude.vim',     { 'on_i' : 1})
call dein#add('jiangmiao/auto-pairs',       { 'merged' : 0})
call dein#add('Shougo/deoplete.nvim',      { 'on_i' : 1, 'loadconf' : 1})

" Checkers
call dein#add('neomake/neomake', { 'merged': 0, 'loadconf' : 1, 'loadconf_before': 1})

" Core
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('benizi/vim-automkdir')

" Ctrlp
call dein#add('ctrlpvim/ctrlp.vim', {'loadconf' : 1})

" Colorscheme
call dein#add('morhetz/gruvbox')

" Denite
call dein#add('Shougo/denite.nvim', {'merged': 0, 'loadconf': 1})

" Emoji
call dein#add('junegunn/vim-emoji')
call dein#add('pocari/vim-denite-emoji')

" Editing
call dein#add('tpope/vim-surround')
call dein#add('scrooloose/nerdcommenter')
call dein#add('editorconfig/editorconfig-vim', { 'on_cmd' : 'EditorConfigReload'})
call dein#add('tpope/vim-repeat')

call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-rhubarb', {'merged': 0})

" Hex
call dein#add('fidian/hexmode', {'merged': 0})


" Incsearch
call dein#add('haya14busa/incsearch.vim', {'merged': 0})
call dein#add('haya14busa/vim-asterisk', {'merged': 0})

" Taskwarrior
call dein#add('blindFS/vim-taskwarrior', {'merged': 0})

" Lang General
call dein#add('groenewege/vim-less',          { 'on_ft' : ['less']})
call dein#add('cakebaker/scss-syntax.vim',              { 'on_ft' : ['scss','sass']})
call dein#add('hail2u/vim-css3-syntax',                 { 'on_ft' : ['css','scss','sass']})
call dein#add('ap/vim-css-color',                       { 'on_ft' : ['css','scss','sass','less','styl']})
call dein#add('othree/html5.vim',                       { 'on_ft' : ['html']})
call dein#add('wavded/vim-stylus',                      { 'on_ft' : ['styl']})
call dein#add('digitaltoad/vim-jade',                   { 'on_ft' : ['jade']})
call dein#add('juvenn/mustache.vim',                    { 'on_ft' : ['mustache']})
call dein#add('leafgarland/typescript-vim',             { 'on_ft' : ['typescript']})
call dein#add('kchmck/vim-coffee-script',               { 'on_ft' : ['coffee']})
call dein#add('leshill/vim-json',                       { 'on_ft' : ['javascript','json']})
call dein#add('elixir-lang/vim-elixir',                 { 'on_ft' : 'elixir'})
call dein#add('PotatoesMaster/i3-vim-syntax',           { 'on_ft' : 'i3'})
call dein#add('isundil/vim-irssi-syntax',               { 'on_ft' : 'irssi'})
call dein#add('lervag/vimtex',                          { 'on_ft' : 'tex'})
call dein#add('vimperator/vimperator.vim',              { 'on_ft' : 'vimperator'})
call dein#add('voxpupuli/vim-puppet',                   {'on_ft' : 'puppet'})
call dein#add('peterhoeg/vim-qml',                      { 'on_ft' : 'qml'})
call dein#add('cespare/vim-toml',                      { 'on_ft' : 'toml'})

" Lang Vim
call dein#add('syngan/vim-vimlint',                      { 'on_ft' : 'vim'})
call dein#add('ynkdir/vim-vimlparser',                      { 'on_ft' : 'vim'})

" Lang Python
call dein#add('klen/python-mode',                      { 'on_ft' : 'python'})

" Lang C
call dein#add('tweekmonster/deoplete-clang2')

" Lang Rust
call dein#add('rust-lang/rust.vim', { 'on_ft' : 'rust'})

" Language Client
call dein#add('autozimu/LanguageClient-neovim', { 'on_ft' : 'rust'})

" Markdown
call dein#add('plasticboy/vim-markdown', { 'on_ft' : 'markdown'})


" UI
call dein#add('vim-airline/vim-airline', {'merged' : 0, 'loadconf' : 1})
call dein#add('vim-airline/vim-airline-themes', {'merged': 0})
call dein#add('mbbill/undotree', {'merged': 0})

" Unite
call dein#add('Shougo/neoyank.vim')

" Wiki
call dein#add('vimwiki/vimwiki')



if dein#check_install()
	call dein#install()
	let pluginsExist=1
endif

call dein#end()
filetype plugin indent on
" }}}

" Colorscheme
colorscheme gruvbox
set background=dark
set termguicolors

" Indent Line
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_concealcursor = 'niv'
let g:indentLine_conceallevel = 2
let g:indentLine_fileTypeExclude = ['help', 'vimfiler']
let g:indentLine_faster = 1

" Leaders
let mapleader=','
let localleader=','

" Tmux Navigator
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

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

" Tab options
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4

" Linenum column
set relativenumber
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
map <C-c> <Esc><Esc>
"" Undotree
map <C-u> :UndotreeToggle<CR>
"" Vim Move
vmap <C-n> <Plug>MoveBlockDown
vmap <C-m> <Plug>MoveBlockUp
nmap <C-n> <Plug>MoveLineDown
nmap <C-m> <Plug>MoveLineUp

" Leader for system clipboard
nnoremap <silent> <Leader>p "+]p
nnoremap <silent> <Leader>P "+]P

nnoremap <silent> <Leader>y :y+<cr>
nnoremap <silent> <Leader>c ^"+c$
nnoremap <silent> <Leader>d ^"+d$

vnoremap <silent> <Leader>y "+y
vnoremap <silent> <Leader>c "+c
vnoremap <silent> <Leader>d "+d

" Rust Configuration
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }
let g:LanguageClient_autoStart = 1

" Python Configuration
let g:pymode_lint = 0
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

" Vimwiki
syntax on
filetype plugin on
hi def link VimwikiEqIn Normal
let g:vimwiki_list = [
            \ {'path': '~/marcqi/gen3/notes/', 
            \ 'css_name': 'default.css', 
            \ 'syntax': 'markdown',
            \ 'ext': '.md',
            \ 'custom_wiki2html': 'wiki2html.sh'}, 
            \
            \ {'path': '~/notes/vimwiki'}]

let indent_guides_guide_size = 1

"This allows for change paste motion cp{motion}
nmap <silent> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
    silent exe "normal! `[v`]\"_c"
    silent exe "normal! p"
endfunction
