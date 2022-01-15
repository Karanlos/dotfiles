local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local packages = require'paq_packages'

local paq = require 'paq'

paq(packages)

require 'plugins.harpoon'
