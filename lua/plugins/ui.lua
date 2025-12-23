return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight")
		end,
	},
    {
    -- lua/plugins/rose-pine.lua
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		vim.cmd("colorscheme rose-pine")
	end
},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {},
	},
}
