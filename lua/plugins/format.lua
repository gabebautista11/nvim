return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",

		opts = {

			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},

			-- Optional: suppress errors if formatter missing
			notify_on_error = false,
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				csharp = { "csharpier" },
			},
		},
	},
}
