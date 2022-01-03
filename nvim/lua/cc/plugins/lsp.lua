require('lspconfig').tsserver.setup({
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
	end
})
require('lspconfig').ccls.setup {}
require('lspconfig').graphql.setup {}
require('lspconfig').gopls.setup {
	settings = {
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
}
require('lspconfig').sumneko_lua.setup {
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT'
			},
			diagnostics = {
				globals = { 'vim' }
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
		}
	}
}
local handle = io.popen("rustup +nightly which rust-analyzer")
local analyzer = string.gsub(handle:read("*a"), '%s+', '')
handle:close()
require('lspconfig').rust_analyzer.setup {
	cmd = { analyzer },
}

local a = vim.api
a.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>',                   { noremap = true})
a.nvim_set_keymap('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<cr>',                        { noremap = true})
a.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<cr>',               { noremap = true})
a.nvim_set_keymap('n', 'g?', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', { noremap = true})
a.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>',                   { noremap = true})
a.nvim_set_keymap('n', 'gR', '<cmd>lua vim.lsp.buf.rename()<cr>',                       { noremap = true})
a.nvim_set_keymap('n', 'g/', '<cmd>lua require("cc.plugins.lsp").disable_diag()<cr>',   { noremap = true})

vim.o.omnifunc = 'v:lua.vim.lsp.omnifunc'

vim.cmd('autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 2000)')
vim.cmd('autocmd BufWritePre *.tsx,*.ts,*.js,*.jsx lua vim.lsp.buf.formatting_sync(nil, 2000)')

local M = {}

M.disable_diag = function()
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = false
		}
	)
end

return M
