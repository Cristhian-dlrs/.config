return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = {
						"node_modules",
						"obj",
						"bin",
						"wwwroot",
					},
					layout_strategy = "vertical",
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			local builtin = require("telescope.builtin")

			-- file system
			vim.keymap.set("n", "<leader>ff", function()
				builtin.find_files({ hidden = true })
			end, {})

			vim.keymap.set("n", "<leader>fa", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {})

			-- git integraiton
			vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
			vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
			vim.keymap.set("n", "<leader>gs", builtin.git_status, {})

			require("telescope").load_extension("ui-select")
		end,
	},
}
