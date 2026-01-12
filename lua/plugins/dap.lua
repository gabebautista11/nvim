return {
	-- Base DAP
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
	},

	-- UI
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},

	-- Mason installs + setup
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"mason-org/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			ensure_installed = {
				"coreclr", -- C#
				"js", -- JavaScript/TypeScript
			},
			automatic_installation = true,

			handlers = {
				-- default handler for all
				function(config)
					require("mason-nvim-dap").default_setup(config)
				end,

				-- Override C#
				coreclr = function(config)
					require("mason-nvim-dap").default_setup(config)
					local dap = require("dap")
					dap.configurations.cs = {
						{
							type = "coreclr",
							request = "launch",
							name = "Launch .NET",
							program = function()
								return vim.fn.input("Path to DLL: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
							end,
						},
					}
				end,

				-- Override JS/TS
				js = function(config)
					require("mason-nvim-dap").default_setup(config)
					local dap = require("dap")
					for _, lang in ipairs({ "javascript", "typescript" }) do
						dap.configurations[lang] = {
							{
								type = "pwa-node",
								request = "launch",
								name = "Launch file",
								program = "${file}",
								cwd = "${workspaceFolder}",
							},
						}
					end
				end,
			},
		},
	},
}
