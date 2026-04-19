return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup()

		vim.keymap.set("n", "<leader>cl", "gcc", { remap = true })
		vim.keymap.set("n", "<leader>ce", "gcA", { remap = true })
		vim.keymap.set("v", "<leader>cl", "gc", { remap = true })
		vim.keymap.set("v", "<leader>cb", "gb", { remap = true })
	end,
	lazy = false,
}
