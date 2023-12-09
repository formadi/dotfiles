return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "main",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  -- opts = {
  --   filesystem = {
  --     filtered_items = {
  --       visible           = true,
  --       show_hidden_count = true,
  --       hide_dotfiles     = false,
  --       hide_gitignored   = true,
  --       hide_by_name = {
  --         ".git",
  --         ".github",
  --         ".DS_Store",
  --         "thumbs.db",
  --       },
  --     },
  --   },
  -- },
  -- init = function()
  --   vim.g.neo_tree_remove_legacy_commands = true
  -- end,
  config = function()
    -- If you want icons for diagnostic errors, you'll need to define them somewhere:
    vim.fn.sign_define("DiagnosticSignError", {text = " ", texthl = "DiagnosticSignError"})
    vim.fn.sign_define("DiagnosticSignWarn",  {text = " ", texthl = "DiagnosticSignWarn"})
    vim.fn.sign_define("DiagnosticSignInfo",  {text = " ", texthl = "DiagnosticSignInfo"})
    vim.fn.sign_define("DiagnosticSignHint",  {text = "󰌵", texthl = "DiagnosticSignHint"})

    require("neo-tree").setup()

    -- set keymaps
    vim.keymap.set("n", "<leader>tt", "<cmd>Neotree toggle<CR>", { desc = "NeoTree Toggle" })
    vim.keymap.set("n", "<leader>e",  "<cmd>Neotree<CR>",        { desc = "focus NeoTree" })
  end,
}
