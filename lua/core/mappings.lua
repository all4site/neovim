vim.g.mapleader = " "
function switchNeotree()
	if vim.bo.filetype == "neo-tree" then
		vim.cmd.wincmd("p")
	else
		vim.cmd.Neotree("focus")
	end
end

-- Buffer
vim.keymap.set("n", "<leader>c", ":bp|sp|bn|bd<CR>", { desc = "Buffer close" })
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<s-Tab>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<leader>bc", ":bd<CR>", { desc = "Current buffer close" })
vim.keymap.set("n", "<leader>bl", ":BufferLinePick<CR>")
vim.keymap.set("n", "<leader>bd", ":BufferLinePickClose<CR>", { desc = "Buffer pick close" })
vim.keymap.set("n", "<leader>ba", ":w|%bd|e#|bd#|NeoTreeShow<CR>", { desc = "Buffer close all except current" })

-- NeoTree
vim.keymap.set("n", "<leader>e", ":Neotree focus toggle<CR>", { desc = "Neotree focus" })
vim.keymap.set("n", "<leader>o", switchNeotree, { desc = "Switch neotree focus" })

-- Comment
vim.keymap.set("n", "<leader>/", function()
	require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
end, { desc = "Comment line" })
vim.keymap.set(
	"v",
	"<leader>/",
	"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
	{ desc = "Comment multiple line" }
)

-- Navigation
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Splits
vim.keymap.set("n", "|", ":vsplit<CR>")
vim.keymap.set("n", "\\", ":split<CR>")

-- Other
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write file" })
vim.keymap.set("n", "<leader>q", ":q|q<CR>", { desc = "Quit" })
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<esc>", ":nohlsearch<CR>", { desc = "No highlight" })

-- Terminal
vim.keymap.set("n", "<leader>tt", ":ToggleTerm direction=float<CR>", { desc = "ToggleTerm" })
vim.keymap.set("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>", { desc = "ToggleTerm horizontal" })
vim.keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical size=40<CR>", { desc = "ToggleTerm vertical" })

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Find word" })

-- Lazygit
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Lazygit" })

-- Hop
vim.keymap.set("n", "<leader>h", "<cmd>HopWord<cr>", { desc = "Hop word" })

--Codeium
vim.keymap.set("i", "<c-j>", function()
	return vim.fn["codeium#Accept"]()
end, { expr = true, desc = "Codeium accept" })
vim.keymap.set("i", "<c-;>", function()
	return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, desc = "Codeium next" })
vim.keymap.set("i", "<c-,>", function()
	return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, desc = "Codeium prev" })
vim.keymap.set("i", "<c-x>", function()
	return vim.fn["codeium#Clear"]()
end, { expr = true, desc = "Codeium clear" })

--Lsp
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>li", "<cmd>TSRemoveUnusedImports<cr>", { desc = "Remove unused imports" })
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Show diagnostics" })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
		vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { desc = "Show declaration" })
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Show implementation" })
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Signature help" })

		-- vim.keymap
		-- .set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { noremap = true })
		-- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder,
		-- opts)
		-- vim.keymap.set('n', '<leader>wl', function()
		-- print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
		-- end, opts)
		-- vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		-- vim.keymap.set("n", "<leader>lf", function()
		--     vim.lsp.buf.format()
		-- end, { desc = 'Format file' })
		vim.keymap.set("n", "<leader>lf", "<cmd>Format<cr>", { buffer = ev.buf, desc = "Format file" })
		vim.keymap.set("n", "<leader>la", function()
			vim.lsp.buf.code_action()
		end, { buffer = ev.buf, desc = "Code action" })
	end,
})
