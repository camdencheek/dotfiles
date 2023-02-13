require('neorg').setup {
    load = {
        ["core.defaults"] = {}, -- Load all the default modules
        ["core.keybinds"] = {
            config = {
                default_keybinds = false,
                hook = function(keybinds)
                    keybinds.map_event_to_mode("norg", {
                        n = {
                            { "<CR>", "core.norg.esupports.hop.hop-link" },
                            { "<M-CR>", "core.norg.esupports.hop.hop-link", "vsplit" },
                        },
                    })
                end,
            }
        },
        ["core.export"] = {
            config = {},
        },
        ["core.export.markdown"] = {
            config = {},
        },
        -- ["core.norg.concealer"] = {
        --     config = {
        --         icons = {
        --             todo = { enabled = false },
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
        -- },
        ["core.norg.dirman"] = { -- Manage your directories with Neorg
            config = {
                workspaces = {
                    default = "~/notes"
                },
                autochdir = true,
                index = "index.norg",
                last_workspace = vim.fn.stdpath("cache") .. "/neorg_last_workspace.txt",
            }
        },
        ["core.integrations.telescope"] = {},
        -- ["core.gtd.base"] = { config = { workspace = "default" } },
    },
}
