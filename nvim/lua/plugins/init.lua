local cmd = vim.cmd
local fn = vim.fn
local g = vim.g

require 'paq' {
    {'savq/paq-nvim', opt = true};   -- paq-nvim manages itself
    'nvim-treesitter/nvim-treesitter';
    'neovim/nvim-lspconfig';
    'ojroques/nvim-lspfuzzy';
    'gruvbox-community/gruvbox';
    'rust-lang/rust.vim';
    'nvim-lua/popup.nvim';
    'nvim-lua/plenary.nvim';
    'nvim-telescope/telescope.nvim';
    'tpope/vim-fugitive';
    'nvim-lua/completion-nvim';
    'robert-oleynik/clangd-nvim';
    'ziglang/zig.vim';
    'theprimeagen/harpoon';
    'sirver/ultisnips';
    'vimwiki/vimwiki';
}

require 'plugins.harpoon'
