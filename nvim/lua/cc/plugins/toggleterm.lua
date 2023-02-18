local tt = require('toggleterm')

local M = {}

function M.setup()
    tt.setup({
        open_mapping = "<C-g>",
    })
end

return M
