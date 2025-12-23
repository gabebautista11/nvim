return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = {
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
