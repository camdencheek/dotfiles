require('lspconfig').rust_analyzer.setup {
    cmd = { "rustup", "run", "nightly", "rust-analyzer" }
}
require('lspconfig').tsserver.setup{}
require('lspconfig').gopls.setup {}
require('lspconfig').ccls.setup {}

local a = vim.api
a.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>',                    { noremap = true})
a.nvim_set_keymap('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<cr>',                         { noremap = true})
a.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<cr>',                { noremap = true})
a.nvim_set_keymap('n', 'g?', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', { noremap = true})
a.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>',                    { noremap = true})
a.nvim_set_keymap('n', 'gR', '<cmd>lua vim.lsp.buf.rename()<cr>',                        { noremap = true})

-- local telescope_mapper = require('cc/plugins/telescope/mappings')
-- telescope_mapper('gr', 'lsp_references', {
-- 	sorting_strategy = "ascending",
-- 	prompt_position = "top",
-- 	ignore_filename = true,
-- }, true)


vim.o.omnifunc = 'v:lua.vim.lsp.omnifunc'

function goimports(timeoutms)
	local context = { source = { organizeImports = true } }
	vim.validate { context = { context, "t", true } }

	local params = vim.lsp.util.make_range_params()
	params.context = context

	local method = "textDocument/codeAction"
	local resp = vim.lsp.buf_request_sync(0, method, params, timeoutms)
	if resp and resp[1] then
		local result = resp[1].result
		if result and result[1] then
			local edit = result[1].edit
			vim.lsp.util.apply_workspace_edit(edit)
		end
	end

	vim.lsp.buf.formatting_sync()
end

vim.cmd('autocmd BufWritePre *.go lua goimports(2000)')
