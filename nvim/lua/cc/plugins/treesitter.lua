local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'f110024d539e676f25b72b7c80b0fd43c34264ef',
    files = {'src/parser.c', 'src/scanner.cc'},
    maintainer = { '@camdencheek' },
  },
  filetype = 'org',
}

require('nvim-treesitter.configs').setup {
	ensure_installed = 'maintained',
	ignore_install = { "comment" },
	highlight = {
		enable = true,
		use_languagetree = true,
		-- disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
		additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
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
	}
}
