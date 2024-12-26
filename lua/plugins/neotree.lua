return {

    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
        "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim"
    },

    opts = {
        close_if_last_window = true,
        --auto_clean_after_session_restore = false,
        window = {

            width = 30,
            mappings = {
                ["o"] = "open",
                ["<space>"] = false

            },
        },
        default_component_configs = {
            icon = {
                folder_empty = "󰜌",
                folder_empty_open = "󰜌",
            },
            modified = { symbol = "" },
            git_status = {
                symbols = {
                    added = "",
                    deleted = "",
                    modified = "",
                    renamed = "➜",
                    untracked = "★",
                    ignored = "◌",
                    unstaged = "✗",
                    staged = "✓",
                    conflict = "",
                },
            },
        },
        document_symbols = {
            kinds = {
                File = { icon = "󰈙", hl = "Tag" },
                Namespace = { icon = "󰌗", hl = "Include" },
                Package = { icon = "󰏖", hl = "Label" },
                Class = { icon = "󰌗", hl = "Include" },
                Property = { icon = "󰆧", hl = "@property" },
                Enum = { icon = "󰒻", hl = "@number" },
                Function = { icon = "󰊕", hl = "Function" },
                String = { icon = "󰀬", hl = "String" },
                Number = { icon = "󰎠", hl = "Number" },
                Array = { icon = "󰅪", hl = "Type" },
                Object = { icon = "󰅩", hl = "Type" },
                Key = { icon = "󰌋", hl = "" },
                Struct = { icon = "󰌗", hl = "Type" },
                Operator = { icon = "󰆕", hl = "Operator" },
                TypeParameter = { icon = "󰊄", hl = "Type" },
                StaticMethod = { icon = '󰠄 ', hl = 'Function' },
            }
        },
        -- Add this section only if you've configured source selector.
        source_selector = {
            winbar = true,
            --        statusline = true,
            sources = {
                { source = "filesystem", display_name = " 󰉓 Files" },
                --{ source = "git_status", display_name = " 󰊢 Git" },
                --{ source = "buffers",    display_name = " 󰈙 Buf" },

            },
        },
        filesystem = {
            follow_current_file = true,
            hijack_netrw_behavior = "open_current",
            use_libuv_file_watcher = true
        },

    }

}