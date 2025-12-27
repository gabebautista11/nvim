return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "[f]ind [f]iles",
			},
			{
				"<leader>fg",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "[f]ind by [g]rep",
			},
			{
				"<leader>fb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "[f]ind [b]uffers",
			},
			{
				"<leader>fh",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "[f]ind [h]elp",
			},
			{
				"<leader>fr",
				function()
					require("telescope.builtin").oldfiles()
				end,
				desc = "[f]ind [r]ecent",
			},
			{
				"<leader>fs",
				function()
					require("telescope.builtin").lsp_document_symbols()
				end,
				desc = "[f]ind [s]ymbols",
			},
			{ "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", desc = "Go to definition (Telescope)" },
			{ "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", desc = "Go to implementation (Telescope)" },
			{ "<leader>gr", "<cmd>Telescope lsp_references<CR>", desc = "Go to references (Telescope)" },
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
	},
	{
		"EL-MASTOR/bufferlist.nvim",
		lazy = true,
		keys = { { "<Leader>b", ":BufferList<CR>", desc = "Open bufferlist" } },
		dependencies = "nvim-tree/nvim-web-devicons",
		cmd = "BufferList",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
}
