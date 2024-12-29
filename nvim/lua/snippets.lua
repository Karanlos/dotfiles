local global_snippets = {
}
local snippets_by_filetype = {
    zig = {
        {
            trigger = 'solve', body = [[
const std = @import("std");
const utils = @import("utils.zig");

fn run(is_test: bool) !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{ .safety = true }){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const contents = utils.readEntireFile(allocator, if (is_test) "inputs/day${1}_test.txt" else "inputs/day${1}.txt");

    var part1: i64 = 0;
    var part2: i64 = 0;

    ${0|var lines = std.mem.tokenizeScalar(u8\, contents\, '\\n');,var tokens = std.mem.tokenizeScalar(u8\, contents\, '\,');,var sections = std.mem.tokenizeSequence(u8\, contents\, "\\n\\n");|}

    part1 = 0;
    part2 = 0;

    std.log.info("Part 1: {d}", .{ part1 });
    std.log.info("Part 2: {d}", .{ part2 });
}
            ]]
        }
    }
}

local function get_buf_snips()
    local ft = vim.bo.filetype
    local snips = vim.list_slice(global_snippets)

    if ft and snippets_by_filetype[ft] then
        vim.list_extend(snips, snippets_by_filetype[ft])
    end

    return snips
end

-- cmp source for snippets to show up in completion menu
function register_cmp_source()
    local cmp_source = {}
    local cache = {}
    function cmp_source.complete(_, _, callback)
        local bufnr = vim.api.nvim_get_current_buf()
        if not cache[bufnr] then
            local completion_items = vim.tbl_map(function(s)
                ---@type lsp.CompletionItem
                local item = {
                    word = s.trigger,
                    label = s.trigger,
                    kind = vim.lsp.protocol.CompletionItemKind.Snippet,
                    insertText = s.body,
                    insertTextFormat = vim.lsp.protocol.InsertTextFormat.Snippet,
                }
                return item
            end, get_buf_snips())

            cache[bufnr] = completion_items
        end

        callback(cache[bufnr])
    end

    require('cmp').register_source('snp', cmp_source)
end
