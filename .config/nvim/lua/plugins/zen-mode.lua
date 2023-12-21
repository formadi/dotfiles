
-- return {
--   "Pocco81/true-zen.nvim",
--   config = function()
--     require("true-zen").setup({
--       integrations = {
--         lualine = true,
--       },
--       modes = {
--         narrow = {
--           folds_style = "invisible",
--           list = false,
--           statusline = "%#Normal#",
--         },
--         minimalist = {
--           options = {
--             list = false,
--             statusline = "%#Normal#",
--           },
--         },
--       },
--     })
--
--
--     -- set keymaps..
--     local wk = require("which-key")
--     wk.register({
--       ["<leader>"] = {
--         z = {
--           name = "True-Zen",
--           n = { "<cmd>TZNarrow<CR>",         "narrow mode"      },
--           f = { "<cmd>TZFocus<CR>",          "focus mode"       },
--           m = { "<cmd>TZMinimalist<CR>",     "minimalist mode"  },
--           a = { "<cmd>TZAtaraxis<CR>",       "ataraxis mode"    },  -- exclusive main
--         },
--       },
--     })
--   end,
-- }



return {
  "folke/zen-mode.nvim",
  opts = {

  },

  config = function()

    -- set keymaps..
    vim.keymap.set("n", "<leader>z",  "<cmd>ZenMode<CR>",      { desc = "zen mode" })

  end,
}
