local M = {}

function M.config()
    local config = {
        close_if_last_window = true,
        window = { -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
            mappings = {
                ["<space>"] = "none",
                ["<2-LeftMouse>"] = "open",
                ["<cr>"] = "open",
                ["<esc>"] = "revert_preview",
                ["P"] = "none",
                ["l"] = "none",
                ["S"] = "open_split",
                -- ["S"] = "split_with_window_picker",
                ["s"] = "open_vsplit",
                -- ["s"] = "vsplit_with_window_picker",
                ["t"] = "open_tabnew",
                -- ["<cr>"] = "open_drop",
                -- ["t"] = "open_tab_drop",
                -- ["w"] = "open_with_window_picker",
                ["C"] = "none",
                ["z"] = "none",
                ["/"] = "fuzzy_sorter",
                --["Z"] = "expand_all_nodes",
                ["R"] = "refresh",
                ["a"] = {
                    "add",
                    -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                    config = {
                        show_path = "none", -- "none", "relative", "absolute"
                    }
                },
                -- ["A"] = "add_directory", -- also accepts the config.show_path and config.insert_as options.
                ["A"] = "none", -- also accepts the config.show_path and config.insert_as options.
                ["d"] = "delete",
                ["r"] = "rename",
                ["y"] = "copy_to_clipboard",
                ["x"] = "cut_to_clipboard",
                ["p"] = "paste_from_clipboard",
                ["c"] = "copy", -- takes text input for destination, also accepts the config.show_path and config.insert_as options
                ["m"] = "move", -- takes text input for destination, also accepts the config.show_path and config.insert_as options
                ["e"] = "toggle_auto_expand_width",
                ["q"] = "close_window",
                ["?"] = "show_help",
                ["<"] = "prev_source",
                [">"] = "next_source",
            },
        },
        filesystem = {
            bind_to_cwd = false,
            follow_current_file = true,    -- This will find and focus the file in the active buffer every time
            use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
            -- instead of relying on nvim autocmd events.
            find_command = "fd",
        },
    }
    require("neo-tree").setup(config)
    vim.keymap.set('n', '<C-t>', function()
        require('neo-tree.command').execute({ focus = true, dir = vim.fn.getcwd() })
    end)
end

return M
