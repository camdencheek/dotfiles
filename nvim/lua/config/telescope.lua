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
    })
    require("telescope").load_extension("fzy_native")
    require("telescope").load_extension("luasnip")

    local map_tele = function(key, f)
        local mode = "n"
        local options = {
            noremap = true,
            silent = true,
        }
        local rhs = "<cmd>Telescope " .. f .. "<cr>"
        vim.api.nvim_set_keymap(mode, key, rhs, options)
    end

    -- Files
    map_tele("<leader>ff", "find_files")
    map_tele("<leader>ft", "git_files")
    map_tele("<leader>fg", "live_grep")
    map_tele("<leader>fo", "oldfiles")
    map_tele("<leader>fd", "fd")

    -- Nvim
    map_tele("<leader>fb", "buffers")
    map_tele("<leader>fi", "search_all_files")
    map_tele("<leader>so", "woptions")
    map_tele("<leader>gp", "grep_prompt")

    vim.api.nvim_set_keymap("c", "<C-r>", "<cmd>Telescope command_history<cr>", { noremap = true, silent = true })

    -- LSP
    map_tele("<leader>ga", "lsp_code_actions")

    -- Telescope Meta
    map_tele("<leader>fB", "builtin")

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
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
        })
        vim.cmd('cd ~/notes')
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
end

return M
