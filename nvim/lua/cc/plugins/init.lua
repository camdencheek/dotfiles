vim.cmd([[packadd packer.nvim]])

require("packer").startup(function(use)
    use({
        -- Packer can manage itself as an optional plugin
        { "wbthomason/packer.nvim", opt = true },

        -- Integration with git.
        -- Trying out neogit again, but fugitive works pretty okay.
        -- "tpope/vim-fugitive",
        { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' },
        "~/src/gitlinker.nvim",

        "windwp/nvim-autopairs",

        -- javascript
        "maxmellon/vim-jsx-pretty",
        "pangloss/vim-javascript",

        "tpope/vim-surround",

        "b3nj5m1n/kommentary",

        -- File browsing
        -- TODO: try out neotree once it stabilizes a bit
        "kyazdani42/nvim-tree.lua",
        "kyazdani42/nvim-web-devicons",

        -- Allows easy switching between vim and kitty panes
        "christoomey/vim-tmux-navigator",
        -- LSP
        "neovim/nvim-lspconfig",
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
        -- Autoconfiguration for lua-language-server with neovim APIs
        "folke/neodev.nvim",


        {
            "nvim-telescope/telescope.nvim",
            requires = {
                -- Use async fzy for telescope because builtin live_grep is slow
                "nvim-telescope/telescope-fzy-native.nvim",
                "nvim-telescope/telescope-fzf-writer.nvim",

                -- Fuzzy search unicode symbols
                "nvim-telescope/telescope-symbols.nvim",
            },
        },

        -- Treesitter
        {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
        },
        "nvim-treesitter/playground",

        -- Colorscheme
        { "npxbr/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } },

        -- Completion
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "onsails/lspkind.nvim",

        -- Snippets
        "l3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "saadparwaiz1/cmp_luasnip",
        "benfowler/telescope-luasnip.nvim",

        {
            "akinsho/toggleterm.nvim",
            tag = "v2.*",
            config = require('cc/plugins/toggleterm').setup,
        },
    })
end)

pcall(require("cc/plugins/kommentary"))
pcall(require("cc/plugins/lsp"))
pcall(require("cc/plugins/telescope"))
pcall(require("cc/plugins/tree"))
pcall(require("cc/plugins/treesitter"))
pcall(require("cc/plugins/gitlinker"))
pcall(require("cc/plugins/cmp"))
require("nvim-autopairs").setup({})
require("luasnip.loaders.from_vscode").lazy_load({
    path = { "/Users/camdencheek/.local/share/nvim/site/pack/packer/start/friendly-snippets" },
})
