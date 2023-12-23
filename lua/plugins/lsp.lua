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
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets',
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
                require("lspconfig")[server_name].setup{
                    capabilities = capabilities,
                }
            end,

            denols = function()
                local nvim_lsp = require('lspconfig')
                nvim_lsp.denols.setup {
                    root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc", ".git"),
                }
            end,

            ts_ls = function()
                local nvim_lsp = require('lspconfig')
                nvim_lsp.ts_ls.setup {
                    root_dir = nvim_lsp.util.root_pattern("tsconfig.json", "jsconfig.json", "package.json"),
                    single_file_support = false
                }
            end,
        })

        -- completion ==========

        local luasnip = require 'luasnip'
        require('luasnip.loaders.from_vscode').lazy_load()
        luasnip.config.setup {}

        cmp.setup {
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert {
                ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
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
                { name = 'nvim_lsp', keyword_length = 2, max_item_count = 10 },
                { name = 'luasnip', keyword_length = 3, max_item_count = 3 },
                { name = 'buffer', key_word_length = 3, max_item_count = 3 },
                { name = 'path' },
            },
        }
    end
}

