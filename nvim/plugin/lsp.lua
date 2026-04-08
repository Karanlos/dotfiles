vim.pack.add({
        'https://github.com/stevearc/conform.nvim',
        'https://github.com/williamboman/mason.nvim',
        'https://github.com/williamboman/mason-lspconfig.nvim',
        'https://github.com/hrsh7th/cmp-nvim-lsp',
        'https://github.com/hrsh7th/cmp-buffer',
        'https://github.com/hrsh7th/cmp-path',
        'https://github.com/hrsh7th/cmp-cmdline',
        'https://github.com/hrsh7th/nvim-cmp',
})
require("conform").setup({
    formatters_by_ft = {
    }
})

local cmp = require('cmp')
local cmp_lsp = require('cmp_nvim_lsp')
local capabilities = vim.tbl_deep_extend(
    'force',
    {},
    vim.lsp.protocol.make_client_capabilities(),
    cmp_lsp.default_capabilities()
)

-- require('fidget').setup({})
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
        'tsserver',
    },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup {
                capabilities = capabilities,
            }
        end,

        ['lua_ls'] = function()
            require('lspconfig').lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        enable = true,
                        defaultConfig = {
                            indent_style = 'space',
                            indent_size = '2',
                        }
                    },
                },
            })
        end,
    },
})

local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    snippet = {
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<c-b>"] = cmp.mapping(
            cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            },
            { "i", "c" }
        ),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm { select = true },
    }),
    sources = cmp.config.sources({
        { name = 'copilot', group_index = 2 },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    }),
})

vim.diagnostic.config({
    float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})
