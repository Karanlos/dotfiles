local cmd = vim.cmd
local fn = vim.fn
local g = vim.g


local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup('ThePrimeagen', {})

local lazypath = fn.stdpath('data')..'/lazy/lazy.nvim'

print(fn.stdpath('data'))

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
            { out, 'WarningMsg' },
            { '\nPress any key to exit...' },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'


-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "gruvbox" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
require('karanlos.set')
require('karanlos.remap')
--
-- require('snippets')



autocmd('LspAttach', {
    group = ThePrimeagenGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set('n', '<leader>wa', function() vim.lsp.buf.add_workspace_folder() end, opts)
        vim.keymap.set('n', '<leader>wr', function() vim.lsp.buf.remove_workspace_folder() end, opts)
        vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
        vim.keymap.set('n', '<leader>D', function() vim.lsp.buf.type_definition() end, opts)
        vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
        vim.keymap.set('n', '<leader>e', function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set('n', '<leader>q', function() vim.diagnostic.setloclist() end, opts)
        vim.keymap.set('n', '<leader>wa', function() vim.lsp.buf.format { async = true } end, opts)
        vim.keymap.set("n", "<leader>gn", vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>c', vim.lsp.buf.code_action, opts)
        vim.keymap.set({'i', 'n'}, '<C-K>', vim.lsp.buf.signature_help, opts)

        local client = vim.lsp.get_client_by_id(e.data.client_id)

        -- if client.name == 'csharp_ls' then
        --     vim.keymap.set('n', 'gd', function()
        --         require('csharpls_extended').lsp_definitions()
        --     end, { noremap = true, desc = 'go to extended definiion', buffer = true })
        -- end
    end
})
