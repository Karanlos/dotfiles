local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
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
    use('rust-lang/rust.vim')
    use('nvim-lua/popup.nvim')
    use('nvim-lua/plenary.nvim')
    use('nvim-telescope/telescope.nvim')
    use('tpope/vim-fugitive')
--    use('nvim-lua/completion-nvim')
    use('robert-oleynik/clangd-nvim')
    use('ziglang/zig.vim')
    use('theprimeagen/harpoon')
    use('vimwiki/vimwiki')
    use('psliwka/vim-smoothie')
    use('iamcco/markdown-preview.nvim', { run = 'cd app && npm install' })
    use('folke/zen-mode.nvim')
    use { 'catppuccin/nvim', as = 'catppuccin' }
end)


