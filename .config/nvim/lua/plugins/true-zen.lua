
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
          c = { "<cmd>TZFocus<CR>",          "focus mode"       },
          i = { "<cmd>TZMinimalist<CR>",     "minimalist mode"  },
          s = { "<cmd>TZAtaraxis<CR>",       "ataraxis mode"    },  -- exclusive main
        },
      },
    })
  end,
}
