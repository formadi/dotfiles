return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  opts = {
    filesystem = {
      filtered_items = {
        visible           = true,
        show_hidden_count = true,
        hide_dotfiles     = false,
        hide_gitignored   = true,
        hide_by_name = {
          ".git",
          ".github",
          ".DS_Store",
          "thumbs.db",
        },
      },
    },
  },
  init = function()
    vim.g.neo_tree_remove_legacy_commands = true
  end,
  config = function()
    require("neo-tree").setup()

    -- set keymaps
    vim.keymap.set("n", "<leader>tt", "<cmd>Neotree toggle<CR>", { desc = "NeoTree Toggle" })
    vim.keymap.set("n", "<leader>e",  "<cmd>Neotree<CR>",        { desc = "focus NeoTree" })
  end,
}
