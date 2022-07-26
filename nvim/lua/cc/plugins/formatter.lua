local util = require("formatter.util")

local function prettier()
	return {
		exe = "prettier",
		args = {
			"--config-precedence",
			"prefer-file",
			"--single-quote",
			"--no-bracket-spacing",
			"--prose-wrap",
			"always",
			"--arrow-parens",
			"always",
			"--trailing-comma",
			"all",
			"--no-semi",
			"--end-of-line",
			"lf",
			"--print-width",
			vim.bo.textwidth <= 80 and 80 or vim.bo.textwidth,
			"--stdin-filepath",
			vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
		},
		stdin = true,
	}
end

require("formatter").setup({
	filetype = {
		lua = { require("formatter.filetypes.lua").stylua },
		typescript = { prettier },
		javascript = { prettier },
		typescriptreact = { prettier },
		javascriptreact = { prettier },
		["javascript.jsx"] = { prettier },
		["typescript.tsx"] = { prettier },
		json = { prettier },
		jsonc = { prettier },
		scss = { prettier },
		less = { prettier },
		yaml = { prettier },
		graphql = { prettier },
		html = { prettier },
	},
	logs = true,
})

vim.api.nvim_command([[
autocmd BufWritePre *.tsx,*.ts,*.js,*.jsx,*.lua FormatWrite 
]])
