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
}
