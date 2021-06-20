local cmd = vim.cmd
local fn = vim.fn
local g = vim.g

cmd 'packadd paq-nvim'               -- load the package manager
local paq = require('paq-nvim').paq  -- a convenient alias
paq {'savq/paq-nvim', opt = true}    -- paq-nvim manages itself
paq {'nvim-treesitter/nvim-treesitter'}
paq {'neovim/nvim-lspconfig'}
paq {'ojroques/nvim-lspfuzzy'}
paq {'gruvbox-community/gruvbox'}
paq {'rust-lang/rust.vim'}
paq {'nvim-lua/popup.nvim'}
paq {'nvim-lua/plenary.nvim'}
paq {'nvim-telescope/telescope.nvim'}
paq {'tpope/vim-fugitive'}
paq {'nvim-lua/completion-nvim'}
paq {'robert-oleynik/clangd-nvim'}
paq {'ziglang/zig.vim'}
paq {'theprimeagen/harpoon'}


require 'plugins.harpoon'
