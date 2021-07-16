local utils = require('utils')

local cmd = vim.cmd
local g = vim.g
local nvim_command = vim.api.nvim_command

g.mapleader = ' '

local indent = 4
cmd 'colorscheme gruvbox'                              -- Put your favorite colorscheme here
utils.opt('b', 'expandtab', true)                           -- Use spaces instead of tabs
utils.opt('b', 'shiftwidth', indent)                        -- Size of an indent
utils.opt('b', 'smartindent', true)                         -- Insert indents automatically
utils.opt('b', 'tabstop', indent)                           -- Number of spaces tabs count for
utils.opt('b', 'swapfile', false)                           -- No swapfile
utils.opt('o', 'completeopt', 'menuone,noinsert,noselect')  -- Completion options (for deoplete)
utils.opt('o', 'hidden', true)                              -- Enable modified buffers in background
utils.opt('o', 'ignorecase', true)                          -- Ignore case
utils.opt('o', 'joinspaces', false)                         -- No double spaces with join after a dot
utils.opt('o', 'scrolloff', 4 )                             -- Lines of context
utils.opt('o', 'shiftround', true)                          -- Round indent
utils.opt('o', 'sidescrolloff', 8 )                         -- Columns of context
utils.opt('o', 'smartcase', true)                           -- Don't ignore case with capitals
utils.opt('o', 'splitbelow', true)                          -- Put new windows below current
utils.opt('o', 'splitright', true)                          -- Put new windows right of current
utils.opt('o', 'termguicolors', true)                       -- True color support
utils.opt('o', 'wildmode', 'list:longest')                  -- Command-line completion mode
utils.opt('w', 'list', true)                                -- Show some invisible characters (tabs...)
utils.opt('w', 'number', true)                              -- Print line number
utils.opt('w', 'relativenumber', true)                      -- Relative line numbers
utils.opt('w', 'wrap', true)                               -- Disable line wrap
utils.opt('w', 'linebreak', true)

require 'telescope'.setup {
  defaults = {
    file_ignore_patterns = {
      "zig%-out/.*",
      "zig%-out\\.*",
      "zig%-cache/.*",
      "zig%-cache\\.*",
      ".git\\.*",
      ".git/.*"
    }
  }
}

g['UltiSnipsExpandTrigger'] = "<leader>n"
g['UltiSnipsEditSplit'] = "vertical"
g['UltiSnipsListSnippets'] = "<leader>v"
