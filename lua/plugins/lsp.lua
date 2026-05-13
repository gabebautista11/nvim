return {
	-- LSP management
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
			},
			automatic_installation = true,

		},
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {
					registries = {
						"github:mason-org/mason-registry",
						"github:Crashdummyy/mason-registry",
					},
				}
			},
			"neovim/nvim-lspconfig",

		},
	},

	--Formatting Mangement
	{
		'stevearc/conform.nvim',
		opts = {
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",

			}
		},

	},

	--treesitter

	{
		"romus204/tree-sitter-manager.nvim",
		dependencies = {}, -- tree-sitter CLI must be installed system-wide
		config = function()
			require("tree-sitter-manager").setup({
				-- Default Options
				ensure_installed = {}, -- list of parsers to install at the start of a neovim session
				-- border = nil, -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
				auto_install = false, -- if enabled, install missing parsers when editing a new file
				-- highlight = true, -- treesitter highlighting is enabled by default
				-- languages = {}, -- override or add new parser sources
				-- parser_dir = vim.fn.stdpath("data") .. "/site/parser",
				-- query_dir = vim.fn.stdpath("data") .. "/site/queries",
			})
		end
	},

	-- language additions
	{
		"seblyng/roslyn.nvim",
		---@module 'roslyn.config'
		---@type RoslynNvimConfig
		opts = {
			-- your configuration comes here; leave empty for default settings
			filewatching = "off",
		},
	}


}
