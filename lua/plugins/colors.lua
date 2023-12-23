function on_background_change(settings)
    local ok, err = pcall(function() require(settings.theme) end)
    if not ok then
        print("Failed to load colorscheme, make sure it's installed")
        return
    end

    local bg_mode = vim.o.background
    local config = settings[bg_mode]
    if config.setup ~= nil then
        require(settings.theme).setup(config.setup)
    end

    vim.cmd("colorscheme " .. config.color)
end

return {
    -- {
    --     "rose-pine/neovim",
    --     name = "rose-pine",
    --     enabled = true,
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         local settings = {
    --             theme = "rose-pine",
    --             dark = {
    --                 color = "rose-pine-moon",
    --                 setup = {
    --                     styles = {
    --                         bold = true,
    --                         italic = false,
    --                         transparency = true,
    --                     },
    --                 }
    --             },
    --             light = {
    --                 color = "rose-pine-dawn",
    --                 setup = {
    --                     styles = {
    --                         bold = true,
    --                         italic = false,
    --                         transparency = false,
    --                     },
    --                 }
    --             },
    --         }
    --         on_background_change(settings)
    --         vim.api.nvim_create_autocmd("OptionSet", {
    --             pattern = "background",
    --             callback = function()
    --                 on_background_change(settings)
    --             end
    --         })
    --     end,
    -- },

    -- {
    --     "ellisonleao/gruvbox.nvim",
    --     priority = 1000,
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
    --         vim.cmd[[colorscheme gruvbox]]
    --     end,
    -- },

    {
        "savq/melange-nvim",
        enabled = true,
        lazy = false,
        priority = 1000,
        init = function()
            vim.g.melange_enable_font_variants = false
            vim.cmd[[colorscheme melange]]
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end,
    },
}
