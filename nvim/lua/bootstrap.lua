local packages = require 'paq_packages'

local function clone_paq()
    local path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
    if vim.fn.empty(vim.fn.glob(path)) > 0 then
        vim.fn.system {
            'git',
            'clone',
            '--depth=1',
            'https://github.com/savq/paq-nvim.git',
            path
        }
    end
end

local function bootstrap_paq()
    clone_paq()

    vim.cmd('packadd paq-nvim')
    local paq = require'paq'

    vim.cmd('autocmd User PaqDoneInstall quit')

    paq(packages)
    paq.install()
end

return { bootstrap_paq = bootstrap_paq }
