return {
    "mfussenegger/nvim-lint",
    ft = { "ruby", "php" },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            ruby = { "ruby" },
            php = { "php" },
        }

        local ns = require("lint").get_namespace("rubocop")
        vim.diagnostic.config({
            -- float = { border = "single" }, -- :help nvim_open_win()
            underline = {
                severity = { min = vim.diagnostic.severity.ERROR },
            },
            virtual_text = {
                severity = { min = vim.diagnostic.severity.WARN },
            },
            signs = true,
        }, ns)

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                lint.try_lint()
            end,
        })

        vim.api.nvim_create_user_command("Rubocop", function()
            vim.diagnostic.reset(ns)
            lint.try_lint("rubocop")
        end, {})
    end,
}
