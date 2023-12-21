
return {
  "Pocco81/true-zen.nvim",
  config = function()
    require("true-zen").setup({
    })

    -- keymap
    -- vim.keymap.set("n", "<leader>sz", "<cmd>TZFocus<CR>", { desc = "window Zen Toggle" })

    -- set keymaps..
    local wk = require("which-key")
    wk.register({
      ["<leader>"] = {
        z = {
          name = "True-Zen",
          n = { "<cmd>TZNarrow<CR>",         "narrow mode"      },
          f = { "<cmd>TZFocus<CR>",          "focus mode"       },
          m = { "<cmd>TZMinimalist<CR>",     "minimalist mode"  },
          a = { "<cmd>TZAtaraxis<CR>",       "ataraxis mode"    },  -- exclusive main
        },
      },
    })
  end,
}
