local M = {}

function M.config()
    require('neorg').setup({
        load = {
            ["core.defaults"] = {}, -- Loads default behaviour
            -- ["core.export"] = {},
            -- ["core.integrations.nvim-cmp"] = {},
            -- ["core.integrations.treesitter"] = {},
            -- ["core.norg.esupports.indent"] = {},
            -- ["core.norg.completion"] = {
            --     config = {
            --         engine = "nvim-cmp",
            --     },
            -- },
            -- ["core.norg.concealer"] = {
            --     config = {
            --         icons = {
            --             todo = { enabled = false },
            --             quote = { enabled = false },
            --             list = { enabled = false },
            --             link = { enabled = false },
            --             ordered = { enabled = false },
            --             ordered_link = { enabled = false },
            --             heading = { enabled = false },
            --             marker = { enabled = false },
            --             definition = { enabled = false },
            --             footnote = { enabled = false },
            --             delimiter = { enabled = false },
            --         },
            --     },
            -- },                       -- Adds pretty icons to your documents
            -- ["core.norg.dirman"] = { -- Manages Neorg workspaces
            --     config = {
            --         workspaces = {
            --             notes = "~/notes",
            --         },
            --     },
            -- },
        },
    })
end

return M
