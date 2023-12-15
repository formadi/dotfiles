return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("todo-comments").setup()

    -- keywords
    -- TODO , HACK, WARN, PREF, NOTE, TEST

    -- set keymaps
    vim.keymap.set("n", "<leader>tq", "<cmd>TodoQuickFix<CR>",  { desc = "Todo Quick Fix" })
    vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<CR>", { desc = "Todo Telescope"})
  end,
}
