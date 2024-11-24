local lsp = require('lsp-zero')
local lsp_config = require('lspconfig')
local autocmd = vim.api.nvim_create_autocmd
local Karanlos_Lsp = vim.api.nvim_create_augroup("Karanlos_Lsp", {})
local luasnip = require('luasnip')

lsp.preset('recommended')

lsp.ensure_installed({'omnisharp'})

vim.keymap.set('n', '<leader>gg', vim.cmd.Git)

autocmd("BufWinEnter", {
    group = Karanlos_Lsp,
    pattern = "*.template",
    callback = function()
        vim.api.nvim_cmd({ cmd = 'setf', args = { 'json' } }, {})
    end,
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select}

local ok, lspkind = pcall(require, 'lspkind')

-- cmp.setup({
--     snippet = {
--         expand = function(args)
--             require('luasnip').lsp_expand(args.body)
--         end,
--     },
--     mapping = {
-- 
--         -- ["<tab>"] = false,
--         ["<tab>"] = nil,
-- 
--         -- Cody completion
--         ["<c-a>"] = cmp.mapping.complete {
--           config = {
--             sources = {
--               { name = "cody" },
--             },
--           },
--         },
-- 
--         -- ["<tab>"] = cmp.mapping {
--         --   i = cmp.config.disable,
--         --   c = function(fallback)
--         --     fallback()
--         --   end,
--         -- },
-- 
--         -- Testing
--         ["<c-q>"] = cmp.mapping.confirm {
--           behavior = cmp.ConfirmBehavior.Replace,
--           select = false,
--         },
-- 
--         -- If you want tab completion :'(
--         --  First you have to just promise to read `:help ins-completion`.
--         --
--         -- ["<Tab>"] = function(fallback)
--         --   if cmp.visible() then
--         --     cmp.select_next_item()
--         --   else
--         --     fallback()
--         --   end
--         -- end,
--         -- ["<S-Tab>"] = function(fallback)
--         --   if cmp.visible() then
--         --     cmp.select_prev_item()
--         --   else
--         --     fallback()
--         --   end
--         -- end,
--     },
--     sources = cmp.config.sources({
--         { name = 'nvim_lsp' },
--         { name = 'luasnip' },
--         { name = 'nvim_lsp_signature_help' },
--     }, {
--         { name = 'buffer' },
--     }),
--     formatting = {
--         format = lspkind.cmp_format {
--             with_text = true,
--             menu = {
--                 buffer = "[buf]",
--                 luasnip = "[snip]",
--                 nvim_lsp = "[LSP]",
--             },
--         }
--     },
--     experimental = {
--         native_menu = false,
--     },
-- })


local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<c-b>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { "i", "c" }
    ),
    ["<M-b>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      { "i", "c" }
    ),

    ["<c-space>"] = cmp.mapping {
      i = cmp.mapping.complete(),
      c = function(
        _ --[[fallback]]
      )
        if cmp.visible() then
          if not cmp.confirm { select = true } then
            return
          end
        else
          cmp.complete()
        end
      end,
    },
    ['<Tab>'] = nil,
    ['<S-Tab>'] = nil,
})

lsp.setup_nvim_cmp({
    mappings = cmp_mappings
})

local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set('n', '<leader>wa', function() vim.lsp.buf.add_workspace_folder() end, opts)
    vim.keymap.set('n', '<leader>wr', function() vim.lsp.buf.remove_workspace_folder() end, opts)
    vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
    vim.keymap.set('n', '<leader>D', function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>e', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', '<leader>q', function() vim.diagnostic.setloclist() end, opts)
    vim.keymap.set('n', '<leader>wa', function() vim.lsp.buf.format { async = true } end, opts)
    vim.keymap.set("n", "<leader>gn", vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>c', vim.lsp.buf.code_action, opts)
    vim.keymap.set({'i', 'n'}, '<C-K>', vim.lsp.buf.signature_help, opts)

    vim.keymap.set({'i', 's'}, '<C-L>', function() luasnip.jump(1) end, {silent = true})
    vim.keymap.set({'i', 's'}, '<C-J>', function() luasnip.jump(-1) end, {silent = true})
    if client.name == "omnisharp" then 
        client.server_capabilities.semanticTokensProvider = {
          full = vim.empty_dict(),
          legend = {
            tokenModifiers = { "static_symbol" },
            tokenTypes = {
              "comment",
              "excluded_code",
              "identifier",
              "keyword",
              "keyword_control",
              "number",
              "operator",
              "operator_overloaded",
              "preprocessor_keyword",
              "string",
              "whitespace",
              "text",
              "static_symbol",
              "preprocessor_text",
              "punctuation",
              "string_verbatim",
              "string_escape_character",
              "class_name",
              "delegate_name",
              "enum_name",
              "interface_name",
              "module_name",
              "struct_name",
              "type_parameter_name",
              "field_name",
              "enum_member_name",
              "constant_name",
              "local_name",
              "parameter_name",
              "method_name",
              "extension_method_name",
              "property_name",
              "event_name",
              "namespace_name",
              "label_name",
              "xml_doc_comment_attribute_name",
              "xml_doc_comment_attribute_quotes",
              "xml_doc_comment_attribute_value",
              "xml_doc_comment_cdata_section",
              "xml_doc_comment_comment",
              "xml_doc_comment_delimiter",
              "xml_doc_comment_entity_reference",
              "xml_doc_comment_name",
              "xml_doc_comment_processing_instruction",
              "xml_doc_comment_text",
              "xml_literal_attribute_name",
              "xml_literal_attribute_quotes",
              "xml_literal_attribute_value",
              "xml_literal_cdata_section",
              "xml_literal_comment",
              "xml_literal_delimiter",
              "xml_literal_embedded_expression",
              "xml_literal_entity_reference",
              "xml_literal_name",
              "xml_literal_processing_instruction",
              "xml_literal_text",
              "regex_comment",
              "regex_character_class",
              "regex_anchor",
              "regex_quantifier",
              "regex_grouping",
              "regex_alternation",
              "regex_text",
              "regex_self_escaped_character",
              "regex_other_escape",
            },
          },
          range = true,
        }
    end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp_config.zls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { '/Users/dkErHoSe/Documents/GitHub/zls/zig-out/bin/zls' }
})

lsp_config.omnisharp.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    organize_imports_on_format = true,
    settings = {
        completions = {
            completeFunctionCalls = true
        }
    }
})

capabilities.textDocument.completion.editsNearCursor = true;
lsp_config.glslls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { '/Users/dkErHoSe/Documents/Source/glsl-language-server/build/glslls', '--stdin' }
})


lsp_config.ols.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lsp_config.sourcekit.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lsp_config.jails.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lsp_config["dartls"].setup({
	on_attach = on_attach,
	settings = {
		dart = {
			analysisExcludedFolders = {
				vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
				vim.fn.expand("$HOME/.pub-cache"),
				vim.fn.expand("/opt/homebrew/"),
				vim.fn.expand("$HOME/tools/flutter/"),
			},
			updateImportsOnRename = true,
			completeFunctionCalls = true,
			showTodos = true,
		},
	},
})

lsp.on_attach(on_attach)

lsp.setup()


--local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
--parser_config.odin = {
--    install_info = {
--        url = "/Users/dkErHoSe/.local/share/nvim/site/pack/packer/start/tree-sitter-odin",
--        branch = 'main',
--        files = { 'src/parser.c' }
--    },
--    filetype = 'odin'
--}
