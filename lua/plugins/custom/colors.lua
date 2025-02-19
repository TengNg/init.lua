return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        enabled = true,
        lazy = false,
        config = function()
            require("gruvbox").setup({
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    operators = false,
                    folds = true,
                },
                transparent_mode = true,
            })
            vim.cmd([[colorscheme gruvbox]])
        end,
    },

    -- {
    --     "rose-pine/neovim",
    --     name = "rose-pine",
    --     priority = 1000,
    --     enabled = true,
    --     lazy = false,
    --     config = function()
    --         require("rose-pine").setup({
    --             styles = {
    --                 bold = true,
    --                 italic = false,
    --                 transparency = true,
    --             },
    --             before_highlight = function(group, highlight, palette)
    --                 if highlight.fg == palette.foam then
    --                     highlight.fg = "#b4d4cf"
    --                 end
    --                 if highlight.fg == palette.pine then
    --                     highlight.fg = "#6e94b2"
    --                 end
    --                 if highlight.fg == palette.gold then
    --                     highlight.fg = "#e8b589"
    --                 end
    --             end,
    --         })
    --         vim.cmd("colorscheme rose-pine-moon")
    --         vim.api.nvim_set_hl(0, "Directory", { fg = "#68998a", bold = true })
    --     end,
    -- },

    -- {
    --     "sainnhe/gruvbox-material",
    --     enabled = true,
    --     priority = 1000,
    --     config = function()
    --         vim.g.gruvbox_material_enable_italic = true
    --         vim.g.gruvbox_material_transparent_background = true
    --         vim.cmd([[colorscheme gruvbox-material]])
    --     end,
    -- },

    -- {
    --     "savq/melange-nvim",
    --     priority = 1000,
    --     enabled = false,
    --     lazy = false,
    --     config = function()
    --         vim.g.melange_enable_font_variants = { italic = false }
    --         vim.cmd("colorscheme melange")
    --         vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --         vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    --         vim.api.nvim_set_hl(0, "StatusLine", { bg = "#34302C" })
    --     end,
    -- },
}
