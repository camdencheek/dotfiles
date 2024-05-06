local M = {}

function M.config()
	require("nvim-treesitter.configs").setup({
		ensure_installed = "all",
		ignore_install = {
			"comment", -- bad performance for many nested languages
			"phpdoc", -- broken install
		},

		highlight = {
			enable = true,
			additional_vim_regex_highlighting = {
				"markdown", -- from obsidian.nvim README.md
			},
			-- use_languagetree = true,
		},

		indent = {
			enable = false,
		},

		incremental_selection = {
			enable = true,
			keymaps = {
				-- mappings for incremental selection (visual mappings)
				init_selection = "vin", -- maps in normal mode to init the node/scope selection
				node_incremental = "vo", -- increment to the upper named parent
				node_decremental = "vi", -- decrement to the previous node
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
				},
			},
		},

		-- Disabled because it was causing exiting to hang
		-- playground = {
		--     enable = true,
		--     disable = {},
		--     updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		--     persist_queries = false, -- Whether the query persists across vim sessions
		--     keybindings = {
		--         toggle_query_editor = 'o',
		--         toggle_hl_groups = 'i',
		--         toggle_injected_languages = 't',
		--         toggle_anonymous_nodes = 'a',
		--         toggle_language_display = 'I',
		--         focus_language = 'f',
		--         unfocus_language = 'F',
		--         update = 'R',
		--         goto_node = '<cr>',
		--         show_help = '?',
		--     },
		-- }
	})
	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
	parser_config.dockerfile = {
		install_info = {
			url = "~/src/tree-sitter-dockerfile", -- local path or git repo
			files = { "src/parser.c", "src/scanner.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
			-- optional entries:
			branch = "main", -- default branch in case of git repo if different from master
			generate_requires_npm = false, -- if stand-alone parser without npm dependencies
			requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
		},
		filetype = "zu", -- if filetype does not match the parser name
	}
end

return M
