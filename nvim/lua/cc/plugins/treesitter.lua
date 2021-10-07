require('nvim-treesitter.configs').setup {
	ensure_installed = 'maintained',
	ignore_install = { "comment" },
	highlight = {
		enable = true,
		use_languagetree = true,
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
