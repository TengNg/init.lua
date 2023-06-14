return {
    'ThePrimeagen/harpoon',
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>m", function()
            mark.add_file()
            print('[Harpoon] mark: ' .. vim.fn.expand('%:t'))
        end, { desc = 'Harpoon: Add file' })

        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = 'Harpoon: Toggle quick-menu' })

        vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = 'Harpoon: Marked-file 1' })
        vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { desc = 'Harpoon: Marked-file 2' })
        vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { desc = 'Harpoon: Marked-file 3' })
        vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { desc = 'Harpoon: Marked-file 4' })
        vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end, { desc = 'Harpoon: Marked-file 5' })

        -- vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end, { desc = 'Harpoon: Marked-file 1' })
        -- vim.keymap.set("n", "<C-g>", function() ui.nav_file(2) end, { desc = 'Harpoon: Marked-file 2' })
        -- vim.keymap.set("n", "<C-y>", function() ui.nav_file(3) end, { desc = 'Harpoon: Marked-file 3' })
        -- vim.keymap.set("n", "<C-t>", function() ui.nav_file(4) end, { desc = 'Harpoon: Marked-file 4' })
    end
}

