vim.cmd([[packadd packer.nvim]])

require("packer").startup(function()
    -- Packer can manage itself as an optional plugin
    use({ "wbthomason/packer.nvim", opt = true })
    use({
        "folke/neodev.nvim",
        "~/src/gitlinker.nvim",
        "tpope/vim-fugitive",
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
        "nvim-telescope/telescope.nvim",

        -- Use async fzy for telescope because builtin live_grep is slow
        "nvim-telescope/telescope-fzy-native.nvim",
        "nvim-telescope/telescope-fzf-writer.nvim",

        -- Fuzzy search unicode symbols
        "nvim-telescope/telescope-symbols.nvim",

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
            'phaazon/mind.nvim',
            branch = 'v2.2',
            requires = { 'nvim-lua/plenary.nvim' },
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
pcall(require("cc/plugins/mind"))
require("nvim-autopairs").setup({})
require("luasnip.loaders.from_vscode").lazy_load({
    path = { "/Users/camdencheek/.local/share/nvim/site/pack/packer/start/friendly-snippets" },
})
