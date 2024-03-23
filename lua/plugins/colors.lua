return {
    {
        "ellisonleao/gruvbox.nvim",
        enabled = true,
        -- lazy = false,
        -- priority = 1000,
        -- init = function()
        --     require("gruvbox").setup({
        --         italic = {
        --             strings = false,
        --             comments = false,
        --         },
        --         contrast = "",
        --         transparent_mode = true,
        --     })
        --     vim.cmd[[colorscheme gruvbox]]
        -- end
    },

    {
        "savq/melange-nvim",
        enabled = true,
        -- lazy = false,
        -- priority = 1000,
        -- init = function()
        --     vim.g.melange_enable_font_variants = false
        --     vim.cmd[[colorscheme melange]]
        --     vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        --     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        -- end,
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        enabled = true,
        lazy = false,
        priority = 1000,
        init = function()
            require("rose-pine").setup({
                styles = {
                    bold = true,
                    italic = false,
                    transparency = true,
                },
            })
            vim.cmd[[colorscheme rose-pine-moon]]
        end,
    },
}
