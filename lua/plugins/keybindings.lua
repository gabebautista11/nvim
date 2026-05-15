return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-mini/mini.icons",
	},
	config = function()
		local wk = require("which-key")

		wk.setup()

		wk.add({
			{ "<leader>t", group = "Telescope" },

			{
				"<leader>?",
				function()
					wk.show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		})
	end,
}
