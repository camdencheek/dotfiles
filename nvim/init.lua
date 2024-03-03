-- Leader key
-- Set leader key before loading plugins so that the defined
-- keybindings are correct
vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

-- Misc options
opt.equalalways = true -- Auto-resize windows
opt.hidden = true
opt.laststatus = 2
opt.lazyredraw = true
opt.mouse = "n"
opt.ruler = true
opt.showcmd = false
opt.ttimeout = true
opt.ttimeoutlen = 50
opt.wildignorecase = true
opt.wildmenu = true
opt.scrolloff = 7
opt.sidescrolloff = 7
opt.cursorline = true
opt.linebreak = true
opt.number = true
opt.wrap = false
opt.textwidth = 120

require("plugins")

-- Colorscheme
opt.termguicolors = true
opt.background = "dark"
vim.cmd([[
	au ColorScheme * hi Normal ctermbg=none guibg=none
	colorscheme gruvbox
	hi! link TelescopeBorder GruvboxYellowBold
	hi! link TelescopePromptBorder Normal
	hi! link TelescopeResultsBorder FloatBorder
	hi! link TelescopePreviewBorder FloatBorder
]])

-- Indentation
opt.tabstop = 2
opt.autoindent = true
opt.cindent = false
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = false

-- Disable sqlcomplete
-- TODO: is this still necessary?
vim.cmd([[
    let g:omni_sql_no_default_maps = 1
]])

-- Backup and undo
opt.backup = false
opt.undofile = true
opt.undolevels = 1000
local data_dir = "/Users/camdencheek/.data/"
opt.backupdir = data_dir .. "backup"
opt.undodir = data_dir .. "undofile"
opt.directory = data_dir .. "swap"
opt.swapfile = false

-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
-- Recalculate folds
-- See https://github.com/nvim-telescope/telescope.nvim/issues/699
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*" },
	command = "normal zx",
})

opt.pumheight = 15

-- Search
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "nosplit"

-- Clipboard
opt.clipboard = "" -- don't use system clipboard

-- Formatting
-- opt.formatoptions = "cqrnj"

-- Splitting
opt.splitright = true
opt.splitbelow = true

vim.keymap.set("n", "gx", [[:silent execute '!open ' . shellescape(expand('<cfile>'), 1)<CR>]], { silent = true })
