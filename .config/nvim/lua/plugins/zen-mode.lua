-- Yey Another Zen Mode
-- return  {
--   "Snikimonkd/yazmp",
--
--   config = function()
--     -- set keymaps..
--     vim.keymap.set("n", "<leader>z",  "<cmd>Zenmode<CR>",      { desc = "zen mode" })
--   end
-- }


-- TRUE_ZEN
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
--     -- vim.keymap.set("n", "<leader>z",  "<cmd>TZFocus<CR>",      { desc = "zen mode" })
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


-- ZEN-MODE
-- return {
--   "folke/zen-mode.nvim",
--   opts = {
--
--   },
--
--   config = function()
--
--     -- set keymaps..
--     vim.keymap.set("n", "<leader>z",  "<cmd>ZenMode<CR>",      { desc = "zen mode" })
--
--   end,
-- }



--- NO NECK PAIN
return {
  "shortcuts/no-neck-pain.nvim",
  config = function()
    require("no-neck-pain").setup({

      buffers = {
        scratchPad = {
          -- set to `false` to
          -- disable auto-saving
          enabled = true,
          -- set to `nil` to default
          -- to current working directory
          location = "/Volumes/Kali/scratch_pad/",
        },
        bo = {
          filetype = "md"
        },
        -- left = {
        --   backgroundColor = "catppuccin-frappe",
        -- },
        -- right = {
        --   backgroundColor = "tokyonight-frappe",
        -- },
      },
    })

    local wk = require("which-key")
    wk.register({
      ["<leader>"] = {
        z = {
          name = "Zen Mode",
          z = { "<cmd>NoNeckPain<CR>",              "toggle"                },
          r = { "<cmd>NoNeckPainResize 160<CR>",    "resize to 160"         },
          i = { "<cmd>NoNeckPainWidthUp<CR><cmd>NoNeckPainWidthUp<CR><cmd>NoNeckPainWidthUp<CR><cmd>NoNeckPainWidthUp<CR>",             "window size increse"   },
          d = { "<cmd>NoNeckPainWidthDown<CR><cmd>NoNeckPainWidthDown<CR><cmd>NoNeckPainWidthDown<CR><cmd>NoNeckPainWidthDown<CR>",     "window size decrese"   },
        },
      },
    })
  end,
}
