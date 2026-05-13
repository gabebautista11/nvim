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
					lualine_c = { {
						function()
							return vim.g.colors_name or "No Color Scheme"
						end,
					}, },
					lualine_x = { "filename" },
					lualine_y = { "filetype" },
					lualine_z = { "lsp_status" },
				},
			}
		end,
	},
	{
		'leo-alvarenga/homecoming.nvim',
		branch = 'nightly', -- Optional: specify the nightly branch if you want to use the latest features
		opts = {
			header = { "Welcome" },
			header_centered = true,
			sections = {
				{
					title = "Actions",
					items = {
						{
							label = "Explore",
							action = function()
								vim.cmd("enew")
								vim.cmd("Explore")
							end,
						},

					},
				},
				{
					title = "Configuration",
					items = {
						{
							label = "Neovim Configuration",
							action = function()
								vim.cmd.Explore(vim.fn.stdpath("config"))
							end,
						},
					}
				},

			},

		},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight-moon")
		end,
	},
}
