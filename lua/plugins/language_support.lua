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
				ensure_installed = { "lua" }, -- list of parsers to install at the start of a neovim session
				nohighlight = { "razor" },
			})
		end
	},

	-- language additions
	--{
	--	"seblyng/roslyn.nvim",
		-----@module 'roslyn.config'
	--	---@type RoslynNvimConfig
--		opts = {
			-- your configuration comes here; leave empty for default settings
--			filewatching = "off",
--		},
	--}


}
