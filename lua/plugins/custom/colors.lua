return {
    {
        "savq/melange-nvim",
        priority = 1000,
        enabled = true,
        lazy = false,
        config = function()
            vim.g.melange_enable_font_variants = { italic = false }
            vim.cmd("colorscheme melange")
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end,
    },

    -- {
    --     "sainnhe/sonokai",
    --     priority = 1000,
    --     enabled = true,
    --     lazy = false,
    --     config = function()
    --         vim.g.sonokai_transparent_background = 1
    --         vim.cmd("colorscheme sonokai")
    --     end,
    -- },

    -- {
    --     "ellisonleao/gruvbox.nvim",
    --     priority = 1000,
    --     enabled = false,
    --     lazy = false,
    --     config = function()
    --         require("gruvbox").setup({
    --             italic = {
    --                 strings = false,
    --                 emphasis = true,
    --                 comments = false,
    --                 operators = false,
    --                 folds = true,
    --             },
    --             transparent_mode = true,
    --             contrast = "hard",
    --         })
    --         vim.cmd([[colorscheme gruvbox]])
    --     end,
    -- },
}
