local cmd = vim.cmd
local fn = vim.fn
local g = vim.g

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')

    use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp-signature-help'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},

        -- Snippets
        {'L3MON4D3/LuaSnip'},
        -- Snippet Collection (Optional)
        {'rafamadriz/friendly-snippets'},
      }
    }

    use('nvim-treesitter/nvim-treesitter')
    use('ojroques/nvim-lspfuzzy')
    use('gruvbox-community/gruvbox')
    use('Mofiqul/vscode.nvim')
    use('gbprod/nord.nvim')
    use('neanias/everforest-nvim')
    use('rust-lang/rust.vim')
    use('onsails/lspkind.nvim')
    use('nvim-lua/popup.nvim')
    use('nvim-lua/plenary.nvim')
    use('nvim-telescope/telescope.nvim')
    use('tpope/vim-fugitive')
    use('navarasu/onedark.nvim')
--    use('nvim-lua/completion-nvim')
    use('robert-oleynik/clangd-nvim')
    use('theprimeagen/harpoon')
    use('vimwiki/vimwiki')
    use('psliwka/vim-smoothie')
    use('iamcco/markdown-preview.nvim', { run = 'cd app && npm install' })
    use('folke/zen-mode.nvim')
    use('Tetralux/odin.vim')
    --use {
    --    'zbirenbaum/copilot.lua',
    --    cmd = 'Copilot',
    --    event = 'InsertEnter',
    --    config = function()
    --        require("copilot").setup({
    --            suggestion = {
    --                auto_trigger = true,
    --                keymap = {
    --                    next = "<C-q>",
    --                }
    --            },
    --            filetypes = {
    --                typescript = true,
    --                javascript = true,
    --                csharp = true,
    --                ["*"] = false,
    --            }
    --        })
    --    end,
    --}
    --use {
    --    'zbirenbaum/copilot-cmp',
    --    after = { 'copilot.lua' },
    --    config = function ()
    --        require('copilot_cmp').setup()
    --    end
    --}
    use('github/Copilot.vim')
    use { 'catppuccin/nvim', as = 'catppuccin' }
    -- use {
    --     'xbase-lab/xbase',
    --     run = 'make install',
    --     requires = {
    --         "neovim/nvim-lspconfig",
    --     },
    --     config = function()
    --             require'xbase'.setup({})
    --     end
    -- }
    use('rluba/jai.vim')
end)


