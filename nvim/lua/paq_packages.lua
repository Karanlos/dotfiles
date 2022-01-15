local packages = {
    'savq/paq-nvim';
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
    {'iamcco/markdown-preview.nvim', run ='cd app && yarn install'}
}

return packages
