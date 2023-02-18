local M = {}

function M.config()
    require("luasnip.loaders.from_vscode").lazy_load({
        path = { "/Users/camdencheek/.local/share/nvim/site/pack/packer/start/friendly-snippets" },
    })
end

return M
