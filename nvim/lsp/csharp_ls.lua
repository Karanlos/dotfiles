return {
    cmd = { 'csharp-ls', '--features', 'metadata-uris' },
    filetypes = { 'cs' },
    root_markers = { '*.sln', '*.csproj', '.git' },
    handlers = {
        ["textDocument/definition"] = function(...) require('csharpls_extended').handler(...) end,
        ["textDocument/typeDefinition"] = function(...) require('csharpls_extended').handler(...) end,
    },
}
