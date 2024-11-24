local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.config.set_config {
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = false,

  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets:
  enable_autosnippets = true,
}

-- some shorthands...
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt


local function pad_str(args, snip)
    return string.rep("0", 2 - #args[1][1]) .. args[1][1]
end

ls.add_snippets("jai", {
    s("solve_day", fmt("solve_day{} :: (test: bool) {{\n    contents := read_entire_file(ifx test then \"inputs/day{}_test.txt\" else \"inputs/day{}.txt\");\n    lines := split(contents, cast(u8) #char \"\\n\");\n\n    part1 := 0;\n    part2 := 0;\n\n    print(\"Part 1: %\\n\", part1);\n    print(\"Part 2: %\\n\", part2);\n}}", { i(1), f(pad_str, 1), f(pad_str, 1) })),

})

ls.add_snippets("zig", {
    s("solve_day", fmt("const std = @import(\"std\");\nconst utils = @import(\"utils.zig\");\n\npub fn run(is_test: bool) !void {{\n    const allocator = std.heap.page_allocator;\n    var contents: []const u8 = try utils.readEntireFile(allocator, if (is_test) \"inputs/day{}_test.txt\" else \"inputs/day{}.txt\");\n    defer allocator.free(contents);\n\n    var lines = std.mem.splitScalar(u8, contents, '\\n');\n\n    var part1: u64 = 0;\n    var part2: u64 = 0;\n\n    std.log.info(\"Part 1: {{d}}\", .{{part1}});\n    std.log.info(\"Part 2: {{d}}\", .{{part2}});\n}}", { i(1), f(pad_str, 1) })),
})

ls.add_snippets("all", {

    s("fmt1", t "wow, you were right!"),


})
