return {

	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		opts = {},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true,
				ensure_installed = {
					"lua_ls",
					"vtsls",
					"html",
					"cssls",
					"cssmodules_ls",
					"css_variables",
					"somesass_ls",
				},
			})
		end,
	},
	{
		"zapling/mason-conform.nvim",
		config = function()
			require("mason-conform").setup({
				automatic_installation = true,
				ensure_installed = { "prettierd", "stylua", "stylelint" },
			})
		end,
	},
	{
		"rshkarin/mason-nvim-lint",
		config = function()
			require("mason-nvim-lint").setup({
				automatic_installation = true,
				ensure_installed = { "eslint_d" },
			})
		end,
	},
}
