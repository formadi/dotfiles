return {
  "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require("statuscol.builtin")

    require("statuscol").setup ({
      relculright = true,
      segments = {
        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
        {
          text = { " ", builtin.lnumfunc, " " },
          condition = { true, builtin.not_empty },
          click = "v:lua.ScLa",
        },
        { text = { "%s"}, click = "v:lua.ScSa", auto=false },
      }

        --   {
      --     sign = { name = { ".*" }, maxwidth = 2, colwidth = 2, auto = true, wrap = false },
      --     click = "v:lua.ScSa"
      --   },
      --   {
      --     sign = { name = { "Diagnostic" }, maxwidth = 1, auto = true },
      --     click = "v:lua.ScSa"
      --   },
      --   { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa", },
      --   { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
      -- }
    })
  end,
}
