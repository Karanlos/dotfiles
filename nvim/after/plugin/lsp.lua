local lsp = require('lsp-zero')
local lsp_config = require('lspconfig')

lsp.preset('recommended')

lsp.ensure_installed({'omnisharp'})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
    }),

    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.config.disable,
    ['<Cr>'] = cmp.mapping.confirm({ select = true }),
    ['<C-space>'] = cmp.mapping.complete(),
})

lsp.set_preferences({
    sign_icons = { }
})

on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set({ 'n', 'i' }, '<C-k>', function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set('n', '<leader>wa', function() vim.lsp.buf.add_workspace_folder() end, opts)
    vim.keymap.set('n', '<leader>wr', function() vim.lsp.buf.remove_workspace_folder() end, opts)
    vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
    vim.keymap.set('n', '<leader>D', function() vim.lsp.buf.type_definitions() end, opts)
    vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>e', function() vimlsp.diagnostics.show_line_diagnostics() end, opts)
    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', '<leader>q', function() vim.lsp.diagnostics.set_loclist() end, opts)
    vim.keymap.set('n', '<leader>wa', function() vim.lsp.buf.format { async = true } end, opts)
    vim.keymap.set("n", "<leader>gn", vim.lsp.buf.rename, opts)
end

lsp.configure('omnisharp', {
    organize_imports_on_format = true
})

lsp_config["dartls"].setup({
	on_attach = on_attach,
	settings = {
		dart = {
			analysisExcludedFolders = {
				vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
				vim.fn.expand("$HOME/.pub-cache"),
				vim.fn.expand("/opt/homebrew/"),
				vim.fn.expand("$HOME/tools/flutter/"),
			},
			updateImportsOnRename = true,
			completeFunctionCalls = true,
			showTodos = true,
		},
	},
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
    }
})

lsp.on_attach(on_attach)

lsp.setup()
