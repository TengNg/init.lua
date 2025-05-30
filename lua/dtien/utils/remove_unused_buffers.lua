-- source: https://www.reddit.com/r/neovim/comments/12c4ad8/closing_unused_buffers/
-- [alternatives] hbac.nvim

local id = vim.api.nvim_create_augroup("startup", {
    clear = false,
})

local persistbuffer = function(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    vim.fn.setbufvar(bufnr, "bufpersist", 1)
end

vim.api.nvim_create_autocmd({ "BufRead" }, {
    group = id,
    pattern = { "*" },
    callback = function()
        vim.api.nvim_create_autocmd({ "InsertEnter", "BufModifiedSet" }, {
            buffer = 0,
            once = true,
            callback = function()
                persistbuffer()
            end,
        })
    end,
})

vim.keymap.set("n", "<leader>b", function()
    local curbufnr = vim.api.nvim_get_current_buf()
    local buflist = vim.api.nvim_list_bufs()
    local bufcount = 0
    for _, bufnr in ipairs(buflist) do
        if
            vim.bo[bufnr].buflisted
            and bufnr ~= curbufnr
            and (vim.fn.getbufvar(bufnr, "bufpersist") ~= 1)
        then
            vim.cmd("bd " .. tostring(bufnr))
            bufcount = bufcount + 1
        end
        print("Closing " .. bufcount .. " unused buffers")
    end
end, { silent = true, desc = "Close unused buffers" })
