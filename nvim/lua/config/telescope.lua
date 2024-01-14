local M = {}

function M.config()
	local actions = require("telescope.actions")
	local sorters = require("telescope.sorters")
	require("telescope").setup({
		defaults = {
			prompt_prefix = "❯ ",
			selection_caret = "❯ ",

			mappings = {
				i = {
					["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
					["<esc>"] = actions.close,
					["<C-c>"] = actions.close,
				},
			},

			file_sorter = sorters.get_fzy_sorter,
			file_previewer = require("telescope.previewers").vim_buffer_cat.new,
			grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
			qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		},
		extensions = {
			["zf-native"] = {
				-- options for sorting file-like items
				file = {
					-- override default telescope file sorter
					enable = true,

					-- highlight matching text in results
					highlight_results = true,

					-- enable zf filename match priority
					match_filename = true,
				},
			},
		},
	})
	require("telescope").load_extension("fzy_native")
	-- require("telescope").load_extension("luasnip")
	require("telescope").load_extension("zf-native")

	local builtin = require("telescope.builtin")

	vim.keymap.set("n", "<leader>ff", builtin.find_files)
	vim.keymap.set("n", "<leader>ft", builtin.git_files)
	vim.keymap.set("n", "<leader>fg", builtin.live_grep)
	vim.keymap.set("n", "<leader>fo", builtin.oldfiles)
	vim.keymap.set("n", "<leader>fd", builtin.fd)
	vim.keymap.set("n", "<leader>fb", builtin.buffers)
	vim.keymap.set("c", "<C-r>", builtin.command_history)
	vim.keymap.set("n", "<leader>ga", "lsp_code_actions")

	-- Telescope Meta
	vim.keymap.set("n", "<leader>fB", "builtin")

	local function fd_nvim()
		return require("telescope.builtin")["fd"]({
			prompt_title = "NVIM Config",
			cwd = "~/.config/nvim",
		})
	end

	local function fn_nvim()
		require("telescope.builtin")["fd"]({
			prompt_title = "Notes",
			cwd = "~/notes",
			find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--glob", "*.norg" },
		})
		vim.cmd("cd ~/notes")
	end

	local function fm_nvim()
		return require("telescope.builtin")["live_grep"]({
			prompt_title = "Notes Grep",
			cwd = "~/notes",
		})
	end

	vim.api.nvim_set_keymap("n", "<leader>fc", "", { callback = fd_nvim, noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<leader>fn", "", { callback = fn_nvim, noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<leader>fm", "", { callback = fm_nvim, noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<leader>fh", ":Telescope harpoon marks<CR>", { noremap = true, silent = true })
end

return M
