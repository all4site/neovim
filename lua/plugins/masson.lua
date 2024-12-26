return {

    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        opts = {}
    },

    {
        'williamboman/mason-lspconfig.nvim',
        build = ':MasonUpdate',
        cmd = { "LspInstall", "LspUninstall" },
        opts = {
            automatic_installation = true,
            ensure_installed = { "lua_ls", "ts_ls", "html", "cssls", "cssmodules_ls" }
        }
    },
    {
        "zapling/mason-conform.nvim",
        config = function()
            require("mason-conform").setup({
                automatic_installation = true,
                ensure_installed = { 'prettierd','stylua','stylelint' }
            })
        end
    },
    {
        "rshkarin/mason-nvim-lint",
        config = function()
            require("mason-nvim-lint").setup({
                automatic_installation = true,
                ensure_installed = { "eslint_d" }
            })
        end
    },

}
