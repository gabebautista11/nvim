return {
	{
		"akinsho/toggleterm.nvim",
		opts = {},
	},

	{
		"gabebautista11/runner.nvim",
		lazy = false,
		config = function()
			require("runner").setup()
		end,
	},
}
