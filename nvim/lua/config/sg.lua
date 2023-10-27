local M = {}

function M.config()
    require('sg').setup {
        download_binaries = false
    }
    vim.api.nvim_set_keymap("n", "<leader>ca", ":CodyAsk ", { noremap = true })
    vim.api.nvim_set_keymap("v", "<leader>ca", ":CodyAsk ", { noremap = true })
end

return M
