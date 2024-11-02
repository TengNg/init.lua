return {
    "echasnovski/mini.statusline",
    enabled = true,
    config = function()
        local statusline = require("mini.statusline")
        statusline.setup({ use_icons = false })

        statusline.section_location = function()
            return "%3l:%-2v|%L"
        end

        statusline.section_fileinfo = function()
            local filetype = vim.bo.filetype
            local encoding = vim.bo.fileencoding or vim.bo.encoding
            local format = vim.bo.fileformat
            return string.format("%s %s[%s]", filetype, encoding, format)
        end

        statusline.section_lsp = function()
            return ""
        end

        statusline.section_diagnostics = function()
            return ""
        end
    end,
}
