local M = {}

function M.config()
    require("toggleterm").setup({
        open_mapping = "<C-g>",
        shade_terminals = false,
        winbar = { enabled = false },
    })
end

return M
