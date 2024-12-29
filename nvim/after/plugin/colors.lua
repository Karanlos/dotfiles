function color_my_pencils(color)
    color = color or vim.g.my_color_scheme or 'onedark'
    vim.cmd.colorscheme(color)

    vim.g.my_color_scheme = color;

--    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
--    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

end

require('catppuccin').setup({
    flavour = 'mocha',
    background = {
        light = 'latte',
        dark = 'mocha',
    },
    integrations = {
        cmp = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
    }
})

require('vscode').setup {
}

require('onedark').setup {
    style = 'darker'
  -- function_style = 'italic',
  -- sidebars = {'qf', 'vista_kind', 'terminal', 'packer'},
  --
  -- -- Change the 'hint' color to the 'orange0' color, and make the 'error' color bright red
  -- colors = {hint = 'orange0', error = '#ff0000'},
  --
  -- -- Overwrite the highlight groups
  -- overrides = function(c)
  --   return {
  --     htmlTag = {fg = c.red0, bg = '#282c34', sp = c.hint, style = 'underline'},
  --     DiagnosticHint = {link = 'LspDiagnosticsDefaultHint'},
  --     -- this will remove the highlight groups
  --     TSField = {},
  --   }
  -- end
}
require('onedark').load()

color_my_pencils('everforest')
