require('utils')
require('lsp')
require('plugins')
require('settings')
require('keybindings')
vim.loop.spawn = (function ()
  local spawn = vim.loop.spawn
  return function(path, options, on_exit)
    local full_path = vim.fn.exepath(path)
    return spawn(full_path, options, on_exit)
  end
end)()
