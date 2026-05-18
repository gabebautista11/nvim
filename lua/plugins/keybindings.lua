return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",

		dependencies = {
			{ "nvim-mini/mini.icons", opts = {} },
		},

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
				{ "<leader>t", group = "Telescope" },
			},

			triggers = {
				{ "<auto>", mode = "nixsotc" },
				{ "a",      mode = { "n", "v" } },
			},
		},
	},
}
