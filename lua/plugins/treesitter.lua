return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"javascript",
				"typescript",
				"c_sharp",
				"html",
				"css",
				"lua",
				"markdown",
				"markdown_inline",
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		},
	},
}
