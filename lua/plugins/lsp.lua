local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local function rename_file()
	local source_file = vim.api.nvim_buf_get_name(0)

	vim.ui.input({
		prompt = "Enter target file name: ",
		default = source_file,
		completion = "file",
	}, function(target_file)
		if not target_file then
			return
		end -- Если файл не был выбран, выходим

		local params = {
			command = "workspace/willRenameFiles", -- Команда для переименования файла в tsserver
			arguments = {
				{
					sourceUri = vim.uri_from_fname(source_file),
					targetUri = vim.uri_from_fname(target_file),
				},
			},
			title = "",
		}

		-- Выполняем команду для переименования файла и обновления импортов
		vim.lsp.buf.execute_command(params)
	end)
end

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
			commands = {
				RenameFile = {
					rename_file,
					description = "Rename File",
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
