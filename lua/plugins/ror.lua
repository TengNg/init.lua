return {
    {
        "tpope/vim-rails",
        lazy = false,
        keys = {
            { "\\c", vim.cmd.Econtroller },
            { "\\v", vim.cmd.Eview },
            { "\\m", vim.cmd.Emodel },
        }
    },

    {
        "slim-template/vim-slim",
        lazy = false
    }
}
