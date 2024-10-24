return {
    'neovim/nvim-lspconfig',
    -- event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        "hrsh7th/cmp-path",
        'saadparwaiz1/cmp_luasnip',
    },
    config = function()
        local cmp = require 'cmp'
        local cmp_lsp = require('cmp_nvim_lsp')

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, cmp_lsp.default_capabilities())

        local mason = require('mason')
        local mason_lspconfig = require('mason-lspconfig')

        mason_lspconfig.setup_handlers({
            function(server_name) -- default handler (optional)
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities,
                })
            end,

            denols = function()
                local lspconfig = require('lspconfig')
                lspconfig.denols.setup({
                    capabilities = capabilities,
                    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
                })
            end,

            ts_ls = function()
                local lspconfig = require('lspconfig')
                lspconfig.ts_ls.setup({
                    capabilities = capabilities,
                    root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json", "package.json"),
                    single_file_support = false
                })
            end,
        })

        -- completion ==========

        cmp.setup({
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

            mapping = cmp.mapping.preset.insert {
                ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ['<C-k>'] = nil,
                ['<C-j>'] = nil,
                -- ['<C-k>'] = cmp.mapping.scroll_docs(-4),
                -- ['<C-j>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete {},
                ['<CR>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Insert, -- i don't like Replace at all
                    select = true,
                },
                ['Tab'] = nil,
                ['S-Tab'] = nil,
            },

            sources = {
                { name = 'nvim_lsp', max_item_count = 10 },
                { name = 'luasnip', max_item_count = 5 },
                { name = 'buffer', max_item_count = 5 },
                { name = 'path' },
            },

            -- Enable luasnip to handle snippet expansion for nvim-cmp
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },
        })
    end
}

