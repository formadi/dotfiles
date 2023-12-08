return {
  "kdheepak/lazygit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "lazygit" })
}
