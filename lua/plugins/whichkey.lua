return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
		opts = {
			spec = {
				{ "<leader>f", group = "[f]ind" }, -- 👈 THIS is the key part
				{ "<leader>g", group = "[G]o To" },
				{ "<leader>t", group = "[T]rouble" },
			},
		},
	},
}
