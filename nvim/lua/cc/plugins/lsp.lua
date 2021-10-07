require('lspconfig').tsserver.setup({
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
	end
})
require('lspconfig').ccls.setup {}
require('lspconfig').sumneko_lua.setup {}
require('lspconfig').graphql.setup {}
require('lspconfig').gopls.setup {}
require('lspconfig').rust_analyzer.setup {}

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
