return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"pyright",
					"ruff",
					"jdtls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lsp = require("lspconfig")

			vim.diagnostic.config({
				virtual_text = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.INFO] = "",
						[vim.diagnostic.severity.HINT] = "",
					},
					numhl = {
						[vim.diagnostic.severity.ERROR] = "LspDiagnosticsLineNrError",
						[vim.diagnostic.severity.WARN] = "LspDiagnosticsLineNrWarning",
					},
				},
			})

			-- Lua
			lsp.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
				capabilities = capabilities,
			})

			-- Python
			local on_attach_pyright = function(client, _)
				-- Disable all capabilities except hoverProvider
				-- client.server_capabilities.completionProvider = false
				-- client.server_capabilities.definitionProvider = false
				-- client.server_capabilities.typeDefinitionProvider = false
				-- client.server_capabilities.implementationProvider = false
				-- client.server_capabilities.referencesProvider = false
				-- client.server_capabilities.documentSymbolProvider = false
				-- client.server_capabilities.workspaceSymbolProvider = false
				-- client.server_capabilities.codeActionProvider = false
				-- client.server_capabilities.documentFormattingProvider = false
				-- client.server_capabilities.documentRangeFormattingProvider = false
				-- client.server_capabilities.renameProvider = false
				-- client.server_capabilities.signatureHelpProvider = false
				-- client.server_capabilities.documentHighlightProvider = false
				-- client.server_capabilities.foldingRangeProvider = false
				-- client.server_capabilities.semanticTokensProvider = false
				-- client.server_capabilities.declarationProvider = false
				-- client.server_capabilities.callHierarchyProvider = false
				-- client.server_capabilities.diagnosticProvider = false

				-- Enable hoverProvider
				client.server_capabilities.hoverProvider = true
			end
			lsp.pyright.setup({
				on_attach = on_attach_pyright,
				capabilities = (function()
					local capabilities = vim.lsp.protocol.make_client_capabilities()
					capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
					return capabilities
				end)(),
				settings = {
					python = {
						analysis = {
							useLibraryCodeForTypes = true,
							diagnosticSeverityOverrides = {
								reportUnusedVariable = "warning",
							},
							typeCheckingMode = "off", -- Set type-checking mode to off
							diagnosticMode = "off", -- Disable diagnostics entirely
						},
					},
				},
			})

			local on_attach_ruff = function(client, _)
				if client.name == "ruff" then
					-- disable hover in favor of pyright
					client.server_capabilities.hoverProvider = false
				end
			end

			lsp.ruff.setup({
				on_attach = on_attach_ruff,
			})
			-- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			-- vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			-- vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

			-- C
			lsp.clangd.setup({
				capabilities = capabilities,
			})

			-- Java
			lsp.jdtls.setup({
				settings = {
					java = {
						format = {
							enabled = false,
						},
						configuration = {
							updateBuildConfiguration = "interactive",
						},
						implementationsCodeLens = {
							enabled = true,
						},
						referencesCodeLens = {
							enabled = true,
						},
						references = {
							includeDecompiledSources = true,
						},
						signatureHelp = { enabled = true },
						completion = { guessMethodArguments = true },
					},
				},
				capabilites = capabilities,
			})

			-- Copilot
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
				},
				filetypes = {
					["*"] = true,
				},
				capabilities = capabilities,
			})
			vim.api.nvim_create_autocmd("User", {
				pattern = "BlinkCmpMenuOpen",
				callback = function()
					vim.b.copilot_suggestion_hidden = true
				end,
			})
			vim.api.nvim_create_autocmd("User", {
				pattern = "BlinkCmpMenuClose",
				callback = function()
					vim.b.copilot_suggestion_hidden = false
				end,
			})

			-- require("CopilotChat").setup({})
		end,
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		config = function()
			require("lazydev").setup({
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			})
		end,
	},
	{
		"luckasRanarison/tailwind-tools.nvim",
		ft = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte", "vue" },
		name = "tailwind-tools",
		build = ":UpdateRemotePlugins",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
		},
		---@type TailwindTools.Option
		opts = {},
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {
			model = "gpt-4.1",
			auto_insert_mode = true,
		},
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
	},
	-- {
	--   'zk-org/zk-nvim',
	--   ft = 'markdown',
	--   config = function()
	--     require('zk').setup {
	--       picker = 'snacks_picker',
	--       lsp = {
	--         config = {
	--           capabilities = require 'j.plugins.lsp.capabilities',
	--         },
	--       },
	--     }
	--   end,
	--   keys = {
	--     { '<leader>zn', [[:ZkNew {title=''}<left><left>]], mode = 'n' },
	--     { '<leader>zn', [[<cmd>ZkNewFromTitleSelection<cr>]], mode = 'x' },
	--     { '<leader>zl', [[<cmd>ZkNotes<cr>]] },
	--     { '<leader>zt', [[<cmd>ZkTags<cr>]] },
	--   },
	-- },
}
