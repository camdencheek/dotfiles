local actions = require('telescope.actions')
local sorters = require('telescope.sorters')

require('telescope').setup {
	defaults = {
		prompt_prefix = '❯ ',
		selection_caret = '❯ ',

		mappings = {
			i = {
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<esc>"] = actions.close,
				["<C-c>"] = actions.close,
			}
		},

		file_sorter = sorters.get_fzy_sorter,
		file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
		grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
		qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
	},

	extensions = {
		-- fzy_native = {
		-- 	override_generic_sorter = false,
		-- 	override_file_sorter = true,
		-- },

		-- fzf_writer = {
		-- 	use_highlighter = true,
		-- 	minimum_grep_characters = 3,
		-- },

		-- frecency = {
		-- 	workspaces = {
		-- 		["conf"] = "/home/tj/.config/nvim/",
		-- 		["nvim"] = "/home/tj/build/neovim",
		-- 	}
		-- }
	},
}
require('telescope').load_extension('fzy_native')

local map_tele = function(key, f)
	local mode = 'n'
	local options = {
		noremap = true,
		silent = true,
	}
	local rhs = '<cmd>Telescope ' .. f .. '<cr>'
	vim.api.nvim_set_keymap(mode, key, rhs, options)
end

-- Files
map_tele('<leader>ff', 'find_files')
map_tele('<leader>ft', 'git_files')
map_tele('<leader>fg', 'live_grep')
map_tele('<leader>fo', 'oldfiles')
map_tele('<leader>fd', 'fd')
map_tele('<leader>pp', 'project_search')

-- Nvim
map_tele('<leader>fb', 'buffers')
map_tele('<leader>fi', 'search_all_files')
map_tele('<leader>so', 'woptions')
map_tele('<leader>gp', 'grep_prompt')

-- Telescope Meta
map_tele('<leader>fB', 'builtin')

vim.api.nvim_set_keymap('n', '<leader>fc', '<cmd>lua require("cc/plugins/telescope").fd_nvim()<cr>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fn', '<cmd>lua require("cc/plugins/telescope").fn_nvim()<cr>', { noremap = true, silent = true})

local main = {}

main.fd_nvim = function()
	return require('telescope.builtin')["fd"]({
		prompt_title = "NVIM Config",
		cwd = "~/.config/nvim",
	})
end

main.fn_nvim = function()
	return require('telescope.builtin')["fd"]({
		prompt_title = "Notes",
		cwd = "~/notes",
	})
end

return main

