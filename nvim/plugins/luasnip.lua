local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

ls.add_snippets(nil, {
  lua = {
    -- vimscriptの変数ライクのapi呼び出し
    -- g: -> vim.g["{1}"]{0}
    s(
      "g:",
      fmt('vim.g["{}"]{}', {
        i(1),
        i(0)
      })
    ),

    -- b: -> vim.b["{1}"]{0}
    s({
      trig = "b:",
    }, {
      --
      t({"vim.b[\""}), i(1), t({"\"]"}), i(0)
    }),

    -- w: -> vim.w["{1}"]{0}
    s({
      trig = "w:",
    }, {
      t({"vim.w[\""}), i(1), t({"\"]"}), i(0)
    }),

    -- t: -> vim.t["{1}"]{0}
    s({
      trig = "t:",
    }, {
      t({"vim.t[\""}), i(1), t({"\"]"}), i(0)
    }),

    -- v: -> vim.v["{1}"]{0}
    s({
      trig = "v:",
    }, {
      t({"vim.v[\""}), i(1), t({"\"]"}), i(0)
    }),

    -- fn -> vim.fn["{1}"]({2}){0}
    s({
      trig = "fn",
    }, {
      t({"vim.fn[\""}), i(1), t({"\"]("}), i(2), t({")"}), i(0)
    }),

  },


  tex = {
    -- dc -> \documentclass{{1}}
    --       {0}
    s({
      trig = "dc"
    }, {
      t({"\\documentclass{"}), i(1), t({"}"}), i(0)
    }),

  }
})
