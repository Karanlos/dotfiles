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

local s = ls.s

local t = ls.text_node

local c = ls.choice_node

local fmt = require('luasnip.extras.fmt').fmt


ls.add_snippets("all", {

    s("fmt1", t "wow, you were right!"),


})
