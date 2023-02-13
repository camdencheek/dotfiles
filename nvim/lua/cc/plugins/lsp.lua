local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("cmp_nvim_lsp").default_capabilities(client_capabilities)

require("lspconfig").tsserver.setup({
	capabilities = capabilities,
})
require("lspconfig").pylsp.setup({
	capabilities = capabilities,
})
-- require("lspconfig").clangd.setup({
-- 	capabilities = capabilities,
-- })
require("lspconfig").graphql.setup({
	capabilities = capabilities,
})
require("lspconfig").ocamllsp.setup({
	capabilities = capabilities,
})
require("lspconfig").gopls.setup({
	capabilities = capabilities,
	settings = {
		gopls = {
            usePlaceholders = true,
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
})
require("lspconfig").sumneko_lua.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})
require("lspconfig").elmls.setup({
	capabilities = capabilities,
})

require'lspconfig'.rust_analyzer.setup({
	cmd = { "rustup", "run", "nightly", "rust-analyzer" },
})


require('lspconfig').bufls.setup({})

local a = vim.api

a.nvim_set_keymap("n", "ga", "", { callback = vim.lsp.buf.code_action, noremap = true })
a.nvim_set_keymap("n", "gd", "", { callback = vim.lsp.buf.definition, noremap = true })
a.nvim_set_keymap("n", "gt", "", { callback = vim.lsp.buf.type_definition, noremap = true })
a.nvim_set_keymap("n", "K", "", { callback = vim.lsp.buf.hover, noremap = true })
a.nvim_set_keymap("n", "gD", "", { callback = vim.lsp.buf.implementation, noremap = true })
a.nvim_set_keymap("n", "g?", "", { callback = vim.diagnostic.open_float, noremap = true })
a.nvim_set_keymap("n", "gr", "", { callback = vim.lsp.buf.references, noremap = true })
a.nvim_set_keymap("n", "gR", "", { callback = vim.lsp.buf.rename, noremap = true })
a.nvim_set_keymap("n", "gq", "", {
	callback = function()
		vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR })
	end,
	noremap = true,
})
-- Disable virtual text
vim.diagnostic.config({ virtual_text = false, })


-- Formatting
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*.rs,*.go,*.lua,*.ts,*.tsx,*.proto" },
	callback = function()
        vim.lsp.buf.format({timeout_ms = 1000})
    end,
})

