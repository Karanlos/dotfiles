require('utils')

local cmd = vim.cmd
local g = vim.g
local nvim_command = vim.api.nvim_command

g.mapleader = ' '

local indent = 2
cmd 'colorscheme gruvbox'                              -- Put your favorite colorscheme here
Utils.opt('b', 'expandtab', true)                           -- Use spaces instead of tabs
Utils.opt('b', 'shiftwidth', indent)                        -- Size of an indent
Utils.opt('b', 'smartindent', true)                         -- Insert indents automatically
Utils.opt('b', 'tabstop', indent)                           -- Number of spaces tabs count for
Utils.opt('o', 'completeopt', 'menuone,noinsert,noselect')  -- Completion options (for deoplete)
Utils.opt('o', 'hidden', true)                              -- Enable modified buffers in background
Utils.opt('o', 'ignorecase', true)                          -- Ignore case
Utils.opt('o', 'joinspaces', false)                         -- No double spaces with join after a dot
Utils.opt('o', 'scrolloff', 4 )                             -- Lines of context
Utils.opt('o', 'shiftround', true)                          -- Round indent
Utils.opt('o', 'sidescrolloff', 8 )                         -- Columns of context
Utils.opt('o', 'smartcase', true)                           -- Don't ignore case with capitals
Utils.opt('o', 'splitbelow', true)                          -- Put new windows below current
Utils.opt('o', 'splitright', true)                          -- Put new windows right of current
Utils.opt('o', 'termguicolors', true)                       -- True color support
Utils.opt('o', 'wildmode', 'list:longest')                  -- Command-line completion mode
Utils.opt('w', 'list', true)                                -- Show some invisible characters (tabs...)
Utils.opt('w', 'number', true)                              -- Print line number
Utils.opt('w', 'relativenumber', true)                      -- Relative line numbers
Utils.opt('w', 'wrap', false)                               -- Disable line wrap

g['deoplete#enable_at_startup'] = 1  -- enable deoplete at startup
g['python3_host_prog'] = 'python'--'C:/Users/ehsej/AppData/Local/Programs/Python/Python39/python.exe'
nvim_command('set shm+=c')
