return {
	"stevearc/conform.nvim",
	ft = { "lua", "vue", "taplo", "python", "bash", "typescript", "typescriptreact", "javascript", "json", "jsonc" },
	opts = {
		formatters_by_ft = {
			python = { "ruff" },
			bash = { "shfmt" },
			lua = { "stylua" },
			vue = { "eslint_d" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			javascript = { "eslint_d" },
			json = { "prettierd" },
			jsonc = { "prettierd" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
