return {
	"navarasu/onedark.nvim",
	lazy = false,
	config = function()
		vim.cmd([[colorscheme onedark]])
		require("onedark").setup({
			style = "deep",
			transparent = false,
			highlights = {
				NeoTreeWinSeparator = { fg = "#333b50", bg = "NONE" },
				NeoTreeNormal = { bg = "#1a212e" },
				NeoTreeNormalNC = { bg = "#1a212e" },
				NeoTreeEndOfBuffer = { bg = "#1a212e" },
			},
		})

		require("onedark").load()
	end,
}
