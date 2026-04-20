return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		presets = {
			command_palette = true,
			inc_rename = false,
			lsp_doc_border = false,
		},

		cmdline = {
			view = "cmdline_popup",
		},

		views = {
			cmdline_popup = {
				position = {
					row = "40%",
					col = "50%",
				},
				size = {
					width = 60,
					height = "auto",
				},
				border = {
					style = "rounded",
				},
				win_options = {
					winblend = 0,
				},
			},
		},

		routes = {
			-- Skip annoying duplicate LSP progress/messages
			{
				filter = {
					event = "lsp",
					kind = "progress",
				},
				opts = { skip = true },
			},

			-- Skip generic noisy messages (but NOT errors)
			{
				filter = {
					event = "msg_show",
					find = "written",
				},
				opts = { skip = true },
			},

			-- Optional: suppress notify spam (but keep errors visible)
			{
				filter = {
					event = "notify",
					min_height = 1,
				},
				opts = { skip = false },
			},
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
}
