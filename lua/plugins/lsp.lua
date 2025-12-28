return {
	{
		"mason-org/mason.nvim",
		build = ":MasonUpdate",
		cmd = { "Mason" },
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		event = "VeryLazy",
		dependencies = { "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp", "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"cssls",
				"html",
				"csharp_ls",
			},
			automatic_installation = true,
		},
	},
}
