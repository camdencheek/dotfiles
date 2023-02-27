local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    "folke/which-key.nvim",

    -- Integration with git.
    -- Trying out neogit again, but fugitive works pretty okay.
    -- "tpope/vim-fugitive",
    {
        'TimUntersberger/neogit',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = require("config.neogit").keys,
    },
    {
        dir = "~/src/gitlinker.nvim",
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = require("config.gitlinker").config,
    },

    {
        "windwp/nvim-autopairs",
        config = require("config.autopairs").config,
    },

    -- javascript
    "maxmellon/vim-jsx-pretty",
    "pangloss/vim-javascript",

    "tpope/vim-surround",

    {
        "numToStr/Comment.nvim",
        config = require("config.comment").config,
    },

    -- File browsing
    -- TODO: try out neotree once it stabilizes a bit
    -- {
    --     "kyazdani42/nvim-tree.lua",
    --     config = require("config.tree").config,
    -- },
    -- "kyazdani42/nvim-web-devicons",
    {
        "nvim-neo-tree/neo-tree.nvim",
        version = "v2.*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = require("config.tree").config,
    },

    -- Allows easy switching between vim and kitty panes
    "christoomey/vim-tmux-navigator",
    -- LSP
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "folke/neodev.nvim",
        },
        config = require("config.lsp").config,
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            -- Use async fzy for telescope because builtin live_grep is slow
            "nvim-telescope/telescope-fzy-native.nvim",
            "nvim-telescope/telescope-fzf-writer.nvim",

            -- Fuzzy search unicode symbols
            "nvim-telescope/telescope-symbols.nvim",
        },
        lazy = false,
        config = require("config.telescope").config,
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = require("config.treesitter").config,
    },
    "nvim-treesitter/playground",

    -- Colorscheme
    {
        "npxbr/gruvbox.nvim",
        dependencies = { "rktjmp/lush.nvim" },
    },

    -- Completion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "onsails/lspkind.nvim",
            "hrsh7th/cmp-cmdline",
        },
        config = require("config.cmp").config,
    },

    -- Snippets
    {
        "l3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
            "saadparwaiz1/cmp_luasnip",
            "benfowler/telescope-luasnip.nvim",
        },
        config = require("config.luasnip").config,
    },

    {
        "akinsho/toggleterm.nvim",
        version = "v2.*",
        config = require('config.toggleterm').config,
    },
})
