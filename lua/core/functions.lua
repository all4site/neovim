-- Выполняем автоимпорты и сохраняем файл, когда изменения были зафиксированы
vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("TS_add_missing_imports", { clear = true }),
	pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
	callback = function()
		-- Выполняем добавление автоимпортов
		vim.defer_fn(function()
			vim.cmd([[TSAddAutoImports]])
		end, 400)

		vim.defer_fn(function()
			vim.cmd([[Format]])
		end, 1000)

		vim.defer_fn(function()
			-- После того, как автоимпорты добавлены, сохраняем файл
			vim.cmd("wa")
		end, 1500)
	end,
})
vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("Format and save scss", { clear = true }),
	pattern = { "*.scss" },
	callback = function(args)
		-- require("conform").format({ bufnr = args.buf })
		vim.defer_fn(function()
			vim.cmd([[Format]])
		end, 100)
		vim.defer_fn(function()
			-- После того, как автоимпорты добавлены, сохраняем файл
			vim.cmd("wa")
		end, 3200)
	end,
})

vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = false, lsp_format = "fallback", range = range })
end, { range = true })

--Remove unused imports
vim.api.nvim_create_user_command("TSRemoveUnusedImports", function()
	vim.lsp.buf.code_action({ apply = true, context = { only = { "source.removeUnused.ts" }, diagnostics = {} } })
end, { desc = "Remove unused imports in TypeScript files" })

--Add auto imports
vim.api.nvim_create_user_command("TSAddAutoImports", function()
	vim.lsp.buf.code_action({ apply = true, context = { only = { "source.addMissingImports.ts" }, diagnostics = {} } })
end, { desc = "Add auto imports in TypeScript files" })

--Rename files
vim.api.nvim_create_user_command("TSRenameFiles", function()
	vim.lsp.buf.code_action({ apply = true, context = { only = { "typescript.applyRenameFile" }, diagnostics = {} } })
end, { desc = "Rename in TypeScript files" })

-- Save session on exit
vim.api.nvim_create_autocmd("VimLeavePre", {
	pattern = "*",
	callback = function()
		vim.cmd("SessionSave")
	end,
})
