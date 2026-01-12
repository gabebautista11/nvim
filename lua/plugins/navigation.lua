return {
	{
		vim.keymap.set("n", "q", function()
			if vim.bo.modified then -- check if buffer has unsaved changes
				vim.cmd("write") -- save buffer
			end
			vim.cmd("bdelete!") -- close the buffer
		end, { noremap = true, silent = true }),
	},
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
		"romgrk/barbar.nvim",
		lazy = false,
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
		keys = {
			{ "<leader>bp", "<cmd>BufferPick<CR>", desc = "Buffer pick" },
			{ "<leader>bh", "<cmd>BufferPrevious<CR>", desc = "Pick left buffer" },
			{ "<leader>bl", "<cmd>BufferNext<CR>", desc = "Pick right buffer" },
			{ "<leader>bc", "<cmd>BufferClose<CR>", desc = "Buffer close" },
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},
}
