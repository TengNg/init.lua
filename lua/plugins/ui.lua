return {
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },

    {
        "echasnovski/mini.statusline",
        config = function()
            vim.opt.laststatus = 3

            local statusline = require("mini.statusline")
            statusline.setup({ use_icons = vim.g.have_nerd_font })
            statusline.section_location = function()
                return "%2l:%-2v"
            end
            statusline.section_lsp = function()
                return ""
            end
            statusline.section_diagnostics = function()
                return ""
            end
        end
    },

    {
        "b0o/incline.nvim",
        event = "VeryLazy",
        config = function()
            local devicons = require("nvim-web-devicons")
            local helpers = require("incline.helpers")
            require("incline").setup({
                window = { margin = { vertical = 0, horizontal = 0 } },
                hide = { cursorline = false },
                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
                    if filename == "" then
                        filename = "[No Name]"
                    end
                    local ft_icon, ft_color = devicons.get_icon_color(filename)
                    local modified = vim.bo[props.buf].modified
                    local filename = filename .. (modified and " [+]" or "")
                
                    return {
                        ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
                        " ",
                        filename,
                        -- { filename, gui = modified and "bold,italic" or "bold" },
                        -- guibg = "#44406e",
                    }
                end,
            })
        end
    },
}
