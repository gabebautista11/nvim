return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = 'make' },
		},
		keys = {
			{
				"<leader>tf",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>tg",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Live Grep",
			},


		},

	},
	{
		'stevearc/oil.nvim',
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	},
	{
		'leo-alvarenga/homecoming.nvim',
		branch = 'nightly', -- Optional: specify the nightly branch if you want to use the latest features
		dependencies = {
			"stevearc/oil.nvim",

		},
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
								require("oil").open()
							end,
						},
						{
							label = "New Buffer",
							action = function()
								vim.cmd.enew()
							end,
						},
						{
							label = "Telescope Files",
							action = function()
								require("telescope.builtin").find_files()
							end,
						},
						{
							label = "Telescope Live Grep",
							action = function()
								require("telescope.builtin").live_grep()
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
								require("oil").open(vim.fn.stdpath("config"))
							end,
						},
					}
				},

			},

		},
	},

}
