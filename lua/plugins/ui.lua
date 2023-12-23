return {
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },

    {
        "echasnovski/mini.statusline",
        config = function()
            local statusline = require("mini.statusline")
            statusline.setup({ use_icons = vim.g.have_nerd_font })
            statusline.section_location = function()
                return '%2l:%-2v'
            end
            statusline.section_lsp = function()
                return ""
            end
            statusline.section_diagnostics = function()
                return ""
            end
        end
    }
}
