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
}
