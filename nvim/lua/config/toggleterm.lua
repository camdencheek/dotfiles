local M = {}

function M.config()
    require("toggleterm").setup({
        open_mapping = "<C-g>",
    })
end

return M
