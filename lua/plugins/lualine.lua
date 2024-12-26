return {
    "nvim-lualine/lualine.nvim",
    opts = {
        options = {
            -- disabled_filetypes = { statusline = { 'neo-tree' } },
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            always_divide_middle = false,
            globalstatus = true,
            -- ignore_focus = { 'neo-tree', 'file_status' },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        },
        sections = {
            lualine_c = {
                {
                    'filename',
                    file_status = true,     -- displays file status (readonly status, modified status)
                    path = 1                -- 0 = just filename, 1 = relative path, 2 = absolute path
                },
                function()
                    return require('auto-session.lib').current_session_name(true)
                  end 

            },
        --     lualine_z = {
        --         "datetime",
        --         'location'
        --     }
        },

    }
}