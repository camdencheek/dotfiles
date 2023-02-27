local M = {}

function M.keys()
    return {
        { "<leader>g", function() require("neogit").open() end, desc = "Open Neogit" }
    }
end

function M.config()

end

return M
