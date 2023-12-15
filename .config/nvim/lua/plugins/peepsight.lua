
return {
  "koenverburg/peepsight.nvim",
  config = function()

    require("peepsight").setup ()
    -- {
    --   relculright = true,
    --   segments = {
    --     {
    --       sign = { name = { "Diagnostic" }, maxwidth = 1, auto = true },
    --       click = "v:lua.ScSa"
    --     },
    --     { text = { builtin.lnumfunc," " }, click = "v:lua.ScLa", },
    --     {
    --       sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
    --       click = "v:lua.ScSa"
    --     },
    --     { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
    --   }
    -- })
    --
    -- set keymaps
    vim.keymap.set("n", "<leader>pe", "<cmd>PeepsightEnable<CR>", { desc = "Peepsight Enable" })
    vim.keymap.set("n", "<leader>pd", "<cmd>PeepsightDisable<CR>", { desc = "Peepsight Disable" })
  end,
}
