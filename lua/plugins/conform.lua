return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				html = { "prettierd" },
				css = { "stylelint" },
				scss = { "stylelint", stop_after_first = true },
				typescript = { "prettierd", stop_after_first = true },
				typescriptreact = { "prettierd", stop_after_first = true },
				javascript = { "prettierd", stop_after_first = true },
				javascriptreact = { "prettierd", stop_after_first = true },
				sh = { "shfmt" },
				bash = { "shfmt" },
			},
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2", "-ci" }, -- 2 пробела и авто-отступ для case/esac
				},
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 3000,
			},
		})
	end,
}
