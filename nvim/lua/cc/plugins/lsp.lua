require('lspconfig').rust_analyzer.setup {
    cmd = { "rustup", "run", "nightly", "rust-analyzer" },
	on_attach=require('completion').on_attach
}
require('lspconfig').tsserver.setup{}
require('lspconfig').gopls.setup {
	on_attach=require('completion').on_attach
}
require('lspconfig').ccls.setup {}
require('lspconfig').sumneko_lua.setup {}

-- From https://www.chrisatmachine.com/Neovim/28-neovim-lua-development/
USER = vim.fn.expand('$USER')

local sumneko_root_path = ""
local sumneko_binary = ""

if vim.fn.has("mac") == 1 then
    sumneko_root_path = "/Users/" .. USER .. "/src/lua-language-server"
    sumneko_binary = "/Users/" .. USER .. "/src/lua-language-server/bin/macOS/lua-language-server"
elseif vim.fn.has("unix") == 1 then
    sumneko_root_path = "/home/" .. USER .. "/src/lua-language-server"
    sumneko_binary = "/home/" .. USER .. "/src/lua-language-server/bin/Linux/lua-language-server"
else
    print("Unsupported system for sumneko")
end

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
            }
        }
    }
}

local a = vim.api
a.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>',                   { noremap = true})
a.nvim_set_keymap('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<cr>',                        { noremap = true})
a.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<cr>',               { noremap = true})
a.nvim_set_keymap('n', 'g?', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', { noremap = true})
a.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>',                   { noremap = true})
a.nvim_set_keymap('n', 'gR', '<cmd>lua vim.lsp.buf.rename()<cr>',                       { noremap = true})
a.nvim_set_keymap('n', 'g/', '<cmd>lua require("cc.plugins.lsp").disable_diag()<cr>',   { noremap = true})

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
vim.cmd('autocmd BufWritePre *.tsx lua goimports(2000)')

local M = {}

M.disable_diag = function()
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = false
		}
	)
end

return M
