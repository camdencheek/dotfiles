local actions = require('telescope.actions')
local sorters = require('telescope.sorters')
local themes = require('telescope.themes')

require('telescope').setup {
	mappings = {
		i = {
			["<c-q>"] = actions.send_to_qflist,
		}
	},

	file_sorter = sorters.get_fzy_sorter,
  file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
  grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
  -- qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
}

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

vim.api.nvim_set_keymap('n', '<leader>fn', '<cmd>lua require("cc/plugins/telescope").run("fd_nvim")<cr>', { noremap = true, silent = true})

local center_list  -- check the above snippet
local with_preview -- check the above snippet
local main = {}

local telescopes = {
  fd_nvim = {
    fun = "fd",
    prompt_title = "NVIM Config",
    shorten_path = false,
    cwd = "~/.config/nvim",
  } 
}

main.run = function(str)
  local base, fun, opts
  if not telescopes[str] then 
    return print("Sorry not found")
  else 
    base = telescopes[str]
    fun = base.fun
  end

  if str then
    print(fun)
    return require('telescope.builtin')[fun](opts)
  else 
    return print("You need to a set a default function")
  end
end

return main
