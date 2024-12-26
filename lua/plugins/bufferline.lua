return {
    'akinsho/bufferline.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
        local bufferline = require('bufferline')
        bufferline.setup({
            options = {
                -- style_preset = bufferline.style_preset.no_italic,
                mode = 'buffers',
                -- diagnostics = "nvim_lsp",
                offsets = {
                    { filetype = 'neo-tree' }
                },
                close_command = "bp|sp|bn|bd",
            },
            highlights = {

                buffer_selected = {
                    fg = '#98c379',
                    -- bg = '#A60000',
                    bold = true,
                    italic = false,
                },
            },

        })
    end
}