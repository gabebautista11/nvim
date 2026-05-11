return {
	{
		"nvim-mini/mini.animate",
		version = "*",
		config = function()
			require("mini.animate").setup()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function()
			return {
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = { "lsp_status" },
					lualine_x = { "filename" },
					lualine_y = { "filetype" },
					lualine_z = { "filesize" },
				},
			}
		end,
	},
	{
		'leo-alvarenga/homecoming.nvim',
		branch = 'nightly', -- Optional: specify the nightly branch if you want to use the latest features
		opts = {}, -- No configuration is required to get started
	},
}
