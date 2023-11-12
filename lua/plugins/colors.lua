return {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    config = function()
        require('rose-pine').setup({
            variant = 'auto',
            dark_variant = 'main',
            disable_italics = true,
            disable_background = true,
        })
        vim.cmd[[colorscheme rose-pine]]
    end
}
