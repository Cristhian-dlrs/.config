return {
	"seblyng/roslyn.nvim",
	ft = "cs",
	opts = {
		filewatching = "auto", -- "auto" | "roslyn" | "off"
		broad_search = false, -- search parent dirs for .sln files
		lock_target = false, -- lock to a specific solution

		-- Optional: auto-select a solution instead of prompting
		-- choose_target = function(targets)
		--   return vim.iter(targets):find(function(t)
		--     return t:match("MyProject%.sln")
		--   end)
		-- end,

		config = {
			-- These are passed directly to the Roslyn LSP server
			settings = {
				["csharp|inlay_hints"] = {
					csharp_enable_inlay_hints_for_implicit_object_creation = true,
					csharp_enable_inlay_hints_for_implicit_variable_types = true,
					csharp_enable_inlay_hints_for_lambda_parameter_types = true,
					csharp_enable_inlay_hints_for_types = true,
					dotnet_enable_inlay_hints_for_indexer_parameters = true,
					dotnet_enable_inlay_hints_for_literal_parameters = true,
					dotnet_enable_inlay_hints_for_object_creation_parameters = true,
					dotnet_enable_inlay_hints_for_other_parameters = true,
					dotnet_enable_inlay_hints_for_parameters = true,
					dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
					dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
					dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
				},
				["csharp|code_lens"] = {
					dotnet_enable_references_code_lens = true,
				},
			},
		},
	},
}
