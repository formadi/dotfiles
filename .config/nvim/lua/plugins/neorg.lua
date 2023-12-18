return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup ({
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/notes",
            },
          },
        },
      },
    })

    -- set keymaps..
    vim.keymap.set("n", "<leader>nt", "<cmd>Neorg journal today<CR>"            , { desc = "neorg journal today" })
    vim.keymap.set("n", "<leader>nw", "<cmd>Neorg workspace work_notes<CR>"     , { desc = "neorg workspace notes" })
    vim.keymap.set("n", "<leader>nm", "<cmd>Neorg workspace main<CR>"           , { desc = "neorg workspace main" })
    vim.keymap.set("n", "<leader>nk", "<cmd>Neorg workspace knowledge_base<CR>" , { desc = "neorg knowledge base" })
    vim.keymap.set("n", "<leader>nc", "<cmd>Neorg workspace config<CR>"         , { desc = "neorg config" })
  end,
}
