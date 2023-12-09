
return {
  "ggandor/leap.nvim",

  config = function()
    require("leap").add_default_mappings()
    -- set keymaps
    -- vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>", { desc = "Aerial Toggle" })
  end,
}
