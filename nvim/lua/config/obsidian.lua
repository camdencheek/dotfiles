local M = {}

function M.config()
    require('obsidian').setup {
        dir = "~/notes",
        daily_notes = {
            folder = "daily",
        },
        follow_url_func = function(url)
            vim.fn.jobstart({ "open", url }) -- Mac OS
        end,
        completion = {
            nvim_cmp = true,
            min_chars = 2,
        }
    }

    vim.api.nvim_set_keymap("n", "<leader>ot", ":ObsidianToday<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>os", ":ObsidianSearch<CR>", { noremap = true })
end

return M
