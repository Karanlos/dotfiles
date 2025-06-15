return {
    'Decodetalkers/csharpls-extended-lsp.nvim',
    config = function()
        local config = {
            handlers = {
                ["textDocument/definition"] = require('csharpls_extended').handler,
                ["textDocument/typeDefinition"] = require('csharpls_extended').handler,
            },
            -- rest of your settings
        }
        require'lspconfig'.csharp_ls.setup(config)
        require("csharpls_extended").buf_read_cmd_bind()
        require('telescope').load_extension('csharpls_definition')
    end
}
