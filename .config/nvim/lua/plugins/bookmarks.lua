
return {
  "tomasky/bookmarks.nvim",
  event = "VimEnter",
  config = function()
    require("bookmarks").setup ({
      sign_priority = 1000,

      on_attach = function(bufnr)
        local bm = require "bookmarks"
        local map = vim.keymap.set
        map("n","<leader>bt",bm.bookmark_toggle, { desc = "toggle" } ) -- add or remove bookmark at current line
        map("n","<leader>ba",bm.bookmark_ann,    { desc = "add"    } )  -- add or edit mark annotation at current line
        map("n","<leader>bc",bm.bookmark_clean,  { desc = "clean"  } )  -- clean all marks in local buffer
        map("n","<leader>bn",bm.bookmark_next,   { desc = "next"   } )  -- jump to next mark in local buffer
        map("n","<leader>bp",bm.bookmark_prev,   { desc = "prev"   } )  -- jump to previous mark in local buffer
        map("n","<leader>bl",bm.bookmark_list,   { desc = "list"   } )  -- show marked file list in quickfix window
      end
    })

    -- set keymaps
    local wk = require("which-key")
    wk.register({
      ["<leader>"] = {
        b = {
          name = "Bookmarks",
        },
      },
    })


  end,
}
