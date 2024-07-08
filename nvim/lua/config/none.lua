local M = {}

function M.config()
	local none_ls = require("null-ls")
	none_ls.setup({
		sources = {
			-- Actions
			-- TODO: consider using the eslint_d options
			-- none_ls.builtins.code_actions.eslint,

			-- Linting
			-- TODO: consider using golangci_lint
			-- none_ls.builtins.diagnostics.eslint,
			none_ls.builtins.diagnostics.buf, -- For proto files
			none_ls.builtins.diagnostics.buildifier, -- For Bazel files
			-- none_ls.builtins.diagnostics.jsonlint,
			-- none_ls.builtins.diagnostics.luacheck,
			none_ls.builtins.diagnostics.sqlfluff.with({ extra_args = { "--dialect", "postgres" } }),

			-- Formatting
			-- TODO: consider using gofmt and goimports here
			none_ls.builtins.formatting.buf, -- for proto files
			none_ls.builtins.formatting.buildifier,
			-- none_ls.builtins.formatting.jq,
			-- TODO: use prettierd? or prettier_d_slim? or prettier_eslint?
			none_ls.builtins.formatting.prettier,
			-- none_ls.builtins.formatting.rustfmt,
			-- TODO: use pg_format? or sqlfmt? or sqlformat? or sql_formatter?
			none_ls.builtins.formatting.sqlfluff.with({ extra_args = { "--dialect", "postgres" } }),
			none_ls.builtins.formatting.stylua,
			-- none_ls.builtins.formatting.taplo, -- for TOML
			-- TODO: yaml formatter?
		},
	})
end

return M
