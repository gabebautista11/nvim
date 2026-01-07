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
	-- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},

			-- 🔒 prevent Noice windows from ever taking focus
			views = {
				popup = {
					enter = false,
					focusable = false,
				},
				cmdline_popup = {
					enter = false,
					focusable = false,
				},
				mini = {
					enter = false,
				},
			},

			-- presets
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = false,
			},
		},

		dependencies = {
			"MunifTanjim/nui.nvim",

			-- nvim-notify (also locked from focus)
			{
				"rcarriga/nvim-notify",
				opts = {
					focusable = false,
					on_open = function(win)
						-- extra safety: force unfocusable after creation
						vim.api.nvim_win_set_config(win, { focusable = false })
					end,
				},
			},
		},
	},
}
