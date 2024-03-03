local M = {}

function M.config()
	local client_capabilities = vim.lsp.protocol.make_client_capabilities()
	local capabilities = require("cmp_nvim_lsp").default_capabilities(client_capabilities)
	local lc = require("lspconfig")

	lc["svelte"].setup({
		capabilities = capabilities,
		filetypes = {
			-- "typescript", "javascript",
			"svelte",
			"html",
			"css",
		},
	})
	lc["tsserver"].setup({ capabilities = capabilities })
	lc["pylsp"].setup({ capabilities = capabilities })
	lc["graphql"].setup({ capabilities = capabilities })
	lc["ocamllsp"].setup({ capabilities = capabilities })
	lc["elmls"].setup({ capabilities = capabilities })
	lc["rust_analyzer"].setup({ capabilities = capabilities })
	lc["bufls"].setup({ capabilities = capabilities })
	lc["clangd"].setup({ capabilities = capabilities })
	lc["gopls"].setup({
		capabilities = capabilities,
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
	})
	lc["lua_ls"].setup({
		capabilities = capabilities,
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
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
	})

	vim.keymap.set("n", "ga", vim.lsp.buf.code_action)
	vim.keymap.set("v", "ga", vim.lsp.buf.code_action)
	vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>")
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition)
	vim.keymap.set("n", "K", vim.lsp.buf.hover)
	vim.keymap.set("n", "gD", ":Telescope lsp_implementations<CR>")
	vim.keymap.set("n", "g?", vim.diagnostic.open_float)
	vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>")
	vim.keymap.set("n", "gR", vim.lsp.buf.rename)
	vim.keymap.set("n", "gq", function()
		vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR })
	end)

	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			client.server_capabilities.semanticTokensProvider = nil
		end,
	})

	-- Disable virtual text
	-- vim.diagnostic.config({ virtual_text = false, })

	-- Formatting
	vim.api.nvim_create_autocmd({ "BufWritePre" }, {
		pattern = { "*.rs,*.go,*.lua,*.ts,*.tsx,*.proto,*.graphql,*.scss,*.md,*.svelte" },
		callback = function()
			vim.lsp.buf.format({ timeout_ms = 1000 })
		end,
	})
end

return M
