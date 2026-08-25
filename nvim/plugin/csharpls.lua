vim.pack.add({
        'https://github.com/Decodetalkers/csharpls-extended-lsp.nvim',
})

require("csharpls_extended").buf_read_cmd_bind()
vim.schedule(function()
    require('telescope').load_extension('csharpls_definition')
end)

-- require('csharpls_extended').setup()
-- return {
--     'Decodetalkers/csharpls-extended-lsp.nvim',
--     config = function()
--         local config = {
--             handlers = {
--                 ["textDocument/definition"] = require('csharpls_extended').handler,
--                 ["textDocument/typeDefinition"] = require('csharpls_extended').handler,
--             },
--             -- rest of your settings
--         }
--         vim.lsp.config('csharp_ls', config)
--         require("csharpls_extended").buf_read_cmd_bind()
--         require('telescope').load_extension('csharpls_definition')
--     end
-- }
