local cmd = vim.cmd
local fn = vim.fn
local g = vim.g

cmd 'packadd paq-nvim'               -- load the package manager
local paq = require('paq-nvim').paq  -- a convenient alias
paq {'savq/paq-nvim', opt = true}    -- paq-nvim manages itself
paq {'shougo/deoplete-lsp'}
paq {'shougo/deoplete.nvim', hook = fn['remote#host#UpdateRemotePlugins']}
paq {'nvim-treesitter/nvim-treesitter'}
paq {'neovim/nvim-lspconfig'}
paq {'junegunn/fzf', hook = fn['fzf#install']}
paq {'junegunn/fzf.vim'}
paq {'ojroques/nvim-lspfuzzy'}
paq {'gruvbox-community/gruvbox'}
g['deoplete#enable_at_startup'] = 1  -- enable deoplete at startup
