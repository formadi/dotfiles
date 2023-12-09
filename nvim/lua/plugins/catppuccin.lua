return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    -- require("neo-tree").setup({
    --   flavour = "Mocha",
    -- })

    vim.cmd.colorscheme("catppuccin")
  end,
}
