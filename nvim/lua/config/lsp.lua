local M = {}

function M.config()
    local client_capabilities = vim.lsp.protocol.make_client_capabilities()
    local capabilities = require("cmp_nvim_lsp").default_capabilities(client_capabilities)
    local lspconfig = require("lspconfig")


    local settings = {
        tsserver = {},
        svelte = {},
        pylsp = {},
        graphql = {},
        ocamllsp = {},
        elmls = {},
        rust_analyzer = {},
        bufls = {},
        clangd = {},
        gopls = {
            gopls = {
                analyses = {
                    deepequalerrors = false,
                    fieldalignment = false,
                    nilness = true,
                    shadow = false,
                    unusedparams = false,
                    unusedwrite = true,
                },
            },
        },
        lua_ls = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { 'vim' },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                    -- TODO: figure out why this is needed to stop luassert stuff
                    checkThirdParty = false,
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        },
    }

    for server, setting in pairs(settings) do
        lspconfig[server].setup({
            capabilities = capabilities,
            settings = setting,
        })
    end

    vim.api.nvim_set_keymap("n", "ga", "", { callback = vim.lsp.buf.code_action, noremap = true })
    vim.api.nvim_set_keymap("v", "ga", "", { callback = vim.lsp.buf.code_action, noremap = true })
    vim.api.nvim_set_keymap("n", "gd", ":Telescope lsp_definitions<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "gt", "", { callback = vim.lsp.buf.type_definition, noremap = true })
    vim.api.nvim_set_keymap("n", "K", "", { callback = vim.lsp.buf.hover, noremap = true })
    vim.api.nvim_set_keymap("n", "gD", ":Telescope lsp_implementations<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "g?", "", { callback = vim.diagnostic.open_float, noremap = true })
    vim.api.nvim_set_keymap("n", "gr", ":Telescope lsp_references<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "gR", "", { callback = vim.lsp.buf.rename, noremap = true })
    vim.api.nvim_set_keymap("n", "gq", "", {
        callback = function()
            vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR })
        end,
        noremap = true,
    })
    -- Disable virtual text
    -- vim.diagnostic.config({ virtual_text = false, })


    -- Formatting
    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
        pattern = { "*.rs,*.go,*.lua,*.ts,*.tsx,*.proto" },
        callback = function()
            vim.lsp.buf.format({ timeout_ms = 1000 })
        end,
    })
end

return M
