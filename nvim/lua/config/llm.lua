return {
	"huggingface/llm.nvim",
	opts = {
		backend = "ollama",
		url = "http://localhost:11434/api/generate",
		-- tokens_to_clear = { "<|endoftext|>" }, -- tokens to remove from the model's output
		-- parameters that are added to the request body, values are arbitrary, you can set any field:value pair here it will be passed as is to the backend
		debounce_ms = 150,
		accept_keymap = "<Tab>",
		dismiss_keymap = "<S-Tab>",
		-- llm-ls configuration, cf llm-ls section
		lsp = {
			bin_path = nil,
			host = nil,
			port = nil,
			version = "0.5.2",
		},
		enable_suggestions_on_startup = true,
		enable_suggestions_on_files = "*",

		request_body = {
			options = {
				temperature = 0.2,
				top_p = 0.95,
			},
		},

		model = "starcoder2:7b",
		tokens_to_clear = { "<|endoftext|>" },
		fim = {
			enabled = true,
			prefix = "<fim_prefix>",
			middle = "<fim_middle>",
			suffix = "<fim_suffix>",
		},
		context_window = 8192,
		tokenizer = {
			repository = "bigcode/starcoder",
		},
	},
}
