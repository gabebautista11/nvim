return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			spec = {
				{ "<leader>f", group = "[f]ind" }, -- 👈 THIS is the key part
				{ "<leader>g", group = "[G]o To" },
				{ "<leader>t", group = "[T]rouble" },
			},
		},
	},
}
