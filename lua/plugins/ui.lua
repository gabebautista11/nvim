return {
	{
		"EdenEast/nightfox.nvim",
		name = "nightfox",
		lazy = false,
		priority = 1000,

		--- lazy.nvim passes opts to this config
		opts = {
			options = {
				colorblind = {
					enable = true,
					severity = { -- fixed spelling
						protan = 1,
						deutan = 0,
						tritan = 0,
					},
				},
			},
		},

		config = function(_, opts)
			-- apply opts to nightfox
			require("nightfox").setup(opts)

			-- pick your theme
			vim.cmd("colorscheme nightfox")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { "diagnostics" },
				lualine_x = { "filetype" },
				lualine_y = { "filename" },
				lualine_z = {},
			},
		},
	},
}
