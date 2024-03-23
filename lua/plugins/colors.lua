return {
    {
        "savq/melange-nvim",
        enabled = false,
        lazy = false,
        priority = 1000,
        init = function()
            vim.g.melange_enable_font_variants = false
            vim.cmd[[colorscheme melange]]
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end,
    },

    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000 ,
        lazy = false,
        config = true,
        init = function()
            require("gruvbox").setup({
                italic = {
                    strings = false,
                    emphasis = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                transparent_mode = true,
            })
            vim.cmd[[colorscheme gruvbox]]
        end,
    }
}
