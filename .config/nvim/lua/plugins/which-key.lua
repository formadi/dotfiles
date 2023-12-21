return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout    = true
    vim.o.timeoutlen = 500

    -- set keymaps..
    local wk = require("which-key")
    wk.register({
      ["<leader>"] = {
        w = {
          name = "Window",
          v = { "<C-w>v",             "sprit vertically"        },
          h = { "<C-w>s",             "sprit horizontalliy"     },
          e = { "<C-w>=",             "make  equal size"        },
          x = { "<cmd>close<CR>",     "close cwd"               },  -- exclusive main
        },
        t = {
          name = "Tab",
          c = { "<cmd>tabnew<CR>",    "create new tab"                 },
          x = { "<cmd>tabclose<CR>",  "close current tab"              },
          n = { "<cmd>tabn<CR>",      "goto next tab"                  },
          p = { "<cmd>tabp<CR>",      "goto previous tab"              },
          f = { "<cmd>tabnew %<CR>",  "open current buffer in new tab" },
        },
      },
    })
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    icons = {
      group = "",  -- eliminate +
    },
  },
}
