-- ============================================================
--                        KEYMAPS
-- ============================================================
-- Modern and safe key mappings using vim.keymap.set
vim.keymap.set("n", "<leader>tc", "<cmd>tabnew<CR>", { desc = "Create Tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabprevious<CR>", { desc = "Previous Tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabnext<CR>", { desc = "Next Tab" })

-- ============================================================
--                        PLUGIN CONFIG
-- ============================================================

return {

	------------------------------------------------------------
	-- LSP CONFIG
	------------------------------------------------------------
	{
		"mason-org/mason.nvim",
		build = ":MasonUpdate",
		opts = {},
	},

	--https://github.com/mason-org/mason-registry/tree/2025-12-09-inland-king/packages
	{
		"mason-org/mason-lspconfig.nvim",
		otps = {
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"cssls",
				"html",
				"csharp_ls",
			},
			automatic_installation = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"ms-jpq/coq_nvim",
				branch = "coq",
				init = function()
					vim.g.coq_settings = {
						auto_start = "shut-up",
					}
				end,
			},
			{ "ms-jpq/coq.artifacts", branch = "artifacts" },
			{ "ms-jpq/coq.thirdparty", branch = "3p" },
		},

		init = function()
			vim.g.coq_settings = {
				auto_start = true,
			}
		end,
		config = function()
			local compabilites = require("coq").lsp_ensure_capabilities()
			vim.lsp.config("*", {
				compabilites = compabilites,
			})
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("cssls")
			vim.lsp.enable("html")
			vim.lsp.enable("csharp_ls")
		end,
	},
	------------------------------------------------------------
	-- AUTOFORMAT
	------------------------------------------------------------
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				local disable_filetypes = { c = true, cpp = true }
				if disable_filetypes[vim.bo[bufnr].filetype] then
					return nil
				end
				return { timeout_ms = 500, lsp_format = "fallback" }
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				csharp = { "csharpier" },
			},
		},
	},

	------------------------------------------------------------
	-- TROUBLE
	------------------------------------------------------------
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,

		config = function()
			vim.diagnostic.config({ virtual_text = false })

			require("tiny-inline-diagnostic").setup({
				options = {
					show_source = { enabled = true },
					add_messages = { display_count = true },
					multilines = { enabled = true },
				},
			})
		end,
	},

	------------------------------------------------------------
	-- TREE-SITTER
	------------------------------------------------------------
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"javascript",
				"typescript",
				"c_sharp",
				"html",
				"css",
				"lua",
				"markdown",
				"markdown_inline",
			},
			auto_install = true,
			highlight = { enable = true, additional_vim_regex_highlighting = { "ruby" } },
			indent = { enable = true, disable = { "ruby" } },
		},
	},

	------------------------------------------------------------
	-- UI PLUGINS
	------------------------------------------------------------
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme tokyonight")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	------------------------------------------------------------
	---AUTO SAVE
	------------------------------------------------------------
	--	{
	--		"okuuva/auto-save.nvim",
	--		version = "^1.0.0", -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
	--		cmd = "ASToggle", -- optional for lazy loading on command
	--		event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
	--		opts = {
	--			-- your config goes here
	--			-- or just leave it empty :)
	--		},
	--	},
	------------------------------------------------------------
	--- GIT INTEGRATION
	------------------------------------------------------------
	{ "lewis6991/gitsigns.nvim" },

	------------------------------------------------------------
	-- NAVIGATION
	------------------------------------------------------------
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		tag = "0.1.5",
		requires = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>sg",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "[s]earch using live [g]rep",
			},
			{
				"<leader>sf",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "[s]earch [f]iles",
			},
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		lazy = true,
		cmd = "Neotree",
		keys = { { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Open file [e]xplore" } },
		dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons" },
		opts = {},
	},

	------------------------------------------------------------
	-- WHICH-KEY
	------------------------------------------------------------
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			spec = {
				{ "<leader>s", group = "[s]earch" },
				{ "<leader>t", group = "[t]ab" },
				{ "<leader>x", group = "trouble" },
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps",
			},
		},
	},

	------------------------------------------------------------
	-- TOGGLETERM
	------------------------------------------------------------
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {},
		keys = {
			{
				"<leader>`",
				function()
					local Terminal = require("toggleterm.terminal").Terminal
					Terminal:new({ hidden = false }):toggle()
				end,
				desc = "New [t]erminal",
			},
		},

		config = function()
			-- Exit terminal mode with Esc
			vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
		end,
	},
}
