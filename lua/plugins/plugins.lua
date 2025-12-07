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
		"neovim/nvim-lspconfig",
		event = { "FileType" },
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"saghen/blink.cmp",
		},
		config = function()
			-- ==========================
			-- Diagnostic Setup
			-- ==========================
			vim.diagnostic.config({
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
				underline = { severity = vim.diagnostic.severity.ERROR },
				signs = vim.g.have_nerd_font and {
					text = {
						[vim.diagnostic.severity.ERROR] = "ó°…š ",
						[vim.diagnostic.severity.WARN] = "ó°€ª ",
						[vim.diagnostic.severity.INFO] = "ó°‹½ ",
						[vim.diagnostic.severity.HINT] = "ó°Œ¶ ",
					},
				} or {},
				virtual_text = {
					source = "if_many",
					spacing = 2,
					format = function(d)
						return d.message
					end,
				},
			})

			-- ==========================
			-- LSP Capabilities
			-- ==========================
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- ==========================
			-- Language Servers
			-- ==========================
			local servers = {
				ts_ls = {},
				lua_ls = {
					settings = {
						Lua = {
							completion = { callSnippet = "Replace" },
							-- diagnostics = { disable = { "missing-fields" } },
						},
					},
				},
			}

			local ensure_installed = vim.tbl_keys(servers)
			vim.list_extend(ensure_installed, { "stylua" })
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				ensure_installed = {},
				automatic_installation = false,
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
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
			},
		},
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
	-- AUTOCOMPLETION
	------------------------------------------------------------
	{
		"saghen/blink.cmp",
		event = "VimEnter",
		version = "1.*",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				version = "2.*",
				build = vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 and nil or "make install_jsregexp",
				opts = {},
			},
			"folke/lazydev.nvim",
		},
		opts = {
			keymap = { preset = "default" },
			appearance = { nerd_font_variant = "mono" },
			completion = { documentation = { auto_show = false, auto_show_delay_ms = 500 } },
			sources = {
				default = { "lsp", "path", "snippets", "lazydev" },
				providers = { lazydev = { module = "lazydev.integrations.blink", score_offset = 100 } },
			},
			snippets = { preset = "luasnip" },
			fuzzy = { implementation = "lua" },
			signature = { enabled = true },
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
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		lazy = true,
		cmd = "Neotree",
		keys = { { "<leader>e", "<cmd>Neotree toggle<CR>" } },
		dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons" },
	},
	{ "lewis6991/gitsigns.nvim" },

	------------------------------------------------------------
	-- TELESCOPE
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

	------------------------------------------------------------
	-- WHICH-KEY
	------------------------------------------------------------
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = { spec = { { "<leader>s", group = "[s]earch" }, { "<leader>t", group = "[t]ab" } } },
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
