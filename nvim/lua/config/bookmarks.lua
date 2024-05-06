return {
	"tomasky/bookmarks.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		require("bookmarks").setup()
		vim.keymap.set("n", "mm", require("bookmarks").bookmark_toggle)
		vim.keymap.set("n", "ma", require("bookmarks").bookmark_ann)
		vim.keymap.set("n", "mc", require("bookmarks").bookmark_clean)
		vim.keymap.set("n", "mn", require("bookmarks").bookmark_next)
		vim.keymap.set("n", "mp", require("bookmarks").bookmark_prev)
		require("telescope").load_extension("bookmarks")
		vim.keymap.set("n", "<leader>fm", require("telescope").extensions.bookmarks.list)
	end,
}
