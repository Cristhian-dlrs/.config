return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				window = {
					position = "left",
				},
			},

			event_handlers = {
				{
					event = "file_opened",
					handler = function()
						-- close neo-tree after opening a file
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
		})

		-- keymaps
		vim.keymap.set("n", "<leader>e", "<cmd>Neotree filesystem reveal left<CR>")
	end,
}
