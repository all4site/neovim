local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		lspconfig.vtsls.setup({
			filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
			capabilities = capabilities,
			settings = {
				typescript = {
					preferences = {
						importModuleSpecifier = "non-relative",
						importModuleSpecifierPreference = "non-relative",
					},
				},
			},
		})
		lspconfig.cssls.setup({
			filetypes = { "css", "scss", "sass" },
			capabilities = capabilities,
		})
		lspconfig.cssmodules_ls.setup({
			filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
			capabilities = capabilities,
		})
		lspconfig.css_variables.setup({
			filetypes = { "css", "scss", "less" },
			capabilities = capabilities,
		})
		lspconfig.somesass_ls.setup({
			filetypes = { "scss", "less" },
			capabilities = capabilities,
		})
	end,
}
