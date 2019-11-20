set nocompatible

call plug#begin('~/.cache/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'Shougo/deoplete.nvim'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
" Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'svermeulen/vim-easyclip'
Plug 'jremmen/vim-ripgrep'
Plug 'christoomey/vim-tmux-navigator'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'bkad/camelcasemotion'
Plug 'mbbill/undotree'
Plug 'haya14busa/incsearch.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'vimwiki/vimwiki'
Plug 'tbabej/taskwiki'
Plug 'svermeulen/vim-yoink'
Plug 'w0rp/ale'


" Typescript
Plug 'HerringtonDarkholme/yats.vim'
"Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
"
call plug#end()

" Colorscheme
colorscheme gruvbox
set background=dark
set termguicolors


" Leaders
let mapleader=','
let maplocalleader=','

" Swap
set noswapfile 

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

" Don't redraw during macro execution
set lazyredraw

" Mappings
nnoremap <C-c> <Esc>
vnoremap <C-c> <Esc>gV
onoremap <C-c> <Esc>
cnoremap <C-c> <C-C><Esc>
inoremap <C-c> <Esc>`^
nnoremap <leader>t :NERDTreeToggle<CR>

" NERDCommenter
let g:NERDSpaceDelims = 1

" Python Configuration
"let g:pymode_lint = 0
let g:pymode_virtualenv = 0

" Markdown configuration
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_conceal = 0

" Set filetype to text if unset
autocmd BufEnter * if &filetype == "" | setlocal ft=text | endif

"" Set wrapping settings, and remap j to do visually down
set nowrap
autocmd FileType {html,markdown,tex} setlocal wrap
autocmd FileType {html,markdown,tex} nnoremap <expr> j v:count ? 'j' : 'gj'
autocmd FileType {html,markdown,tex} nnoremap <expr> k v:count ? 'k' : 'gk'




" Tex folding
autocmd FileType {tex} setlocal foldmethod=marker
autocmd FileType {tex} setlocal foldmarker=%{{{,%}}}
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
filetype plugin on

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

nmap <C-g> :RgLive<Enter>
command! -bang -nargs=* RgLive
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --hidden --fixed-strings --follow --ignore-case --glob "!.git/*" --glob "!node_modules/*" --glob "!vendor/*" --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)

" Topd integration
"function IncrementTopd()
	"execute  "!topd --store_name 'files.json' --add " . expand('%:p')
"endfunction
"autocmd BufNewFile,BufReadPost * call IncrementTopd()

" Rust
let g:rust_recommended_style = 1

"ALE

map gd <Plug>(ale_go_to_definition)
map gf <Plug>(ale_fix)
let g:ale_completion_enabled = 1
let g:ale_linters = {
			\   'go': [
			\     'gopls',
            \     'golint',
			\   ],
			\   'rust': [
			\     'rls',
			\   ],
			\   'ruby': [
			\     'solargraph',
			\     'rubocop',
			\   ]
			\ }
let g:ale_fixers = {
            \ 'go': [
            \   'gofmt',
            \   'goimports',
            \   'remove_trailing_lines',
            \   'trim_whitespace',
			\ ],
			\ 'typescript': [
			\   'tslint',
			\   'remove_trailing_lines',
			\ ],
			\ 'ruby': [
			\   'rubocop',
			\ ],
			\}

" Command line shortcuts
cmap <C-f> <Right>
cmap <C-b> <Left>
cnoremap <C-d> <C-f>

"Snippets
"map <C-s> <Esc>:Snippets<CR>
"let g:UltiSnipsEditSplit = 'context'
"let g:UltiSnipsSnippetsDir="~/.data/myUltiSnips"
"let g:UltiSnipsSnippetDirectories = ['/Users/ccheek/.data/myUltiSnips']
"let g:UltiSnipsJumpForwardTrigger='<tab>'

"Typescript
"autocmd FileType {typescript} nmap gd :TSDef<Enter>
"let g:nvim_typescript#diagnostics_enable = 0
"autocmd BufWrite *.ts,*.tsx TSGetDiagnostics

" NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Vimwiki
let g:vimwiki_list = [{'path': '~/notes',
            \ 'syntax': 'markdown', 'ext': '.md',
            \ 'automatic_nested_syntax': 1}]
let g:vimwiki_folding = 'list'

" Vim yoink
let g:yoinkSavePersistently = 1

" deoplete settings
call deoplete#custom#option({
            \    'auto_complete_delay': 100,
            \    'max_list': 100,
            \ })
