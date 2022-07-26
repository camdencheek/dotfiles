local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

parser_config.norg_meta = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
        files = { "src/parser.c" },
        branch = "main"
    },
}

parser_config.norg_table = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
        files = { "src/parser.c" },
        branch = "main"
    },
}

require('nvim-treesitter.configs').setup {
    ensure_installed = 'all',
    ignore_install = {
        "comment",  -- bad performance for many nested languages
        "phpdoc",  -- broken install
        "markdown", -- very bad performance
    },

    highlight = {
        enable = true,
        -- use_languagetree = true,
    },

    indent = {
        enable = false,
    },

    incremental_selection = {
        enable = true,
        keymaps = { -- mappings for incremental selection (visual mappings)
            init_selection = 'vin',    -- maps in normal mode to init the node/scope selection
            node_incremental = 'vo',  -- increment to the upper named parent
            node_decremental = 'vi',  -- decrement to the previous node
        },
    },

    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            }
        }
    },

    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
    }
}
