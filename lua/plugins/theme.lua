return {
	"navarasu/onedark.nvim",
	lazy = false,
	config = function()
		vim.cmd([[colorscheme onedark]])
		require("onedark").setup({
			style = "deep",
			transparent = true,
			-- lualine = {
			--   transparent = true, -- lualine center bar transparency
			-- },
		})

		require("onedark").load()
	end,
}
