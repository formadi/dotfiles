return {
  -- order is important.
  -- no-nect-pain first and zen-mode last.
  {
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
          wo = {
            colorcolumn    = "0",
            cursorcolumn   = false,
            cursorline     = false,
            foldenable     = true,
            linebreak      = true,
            list           = false,
            number         = false,
            relativenumber = false,
            wrap           = false,
          },
          bo = {
            filetype = "norg"
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
            r = { "<cmd>NoNeckPainResize 120<CR>",    "resize to 160"         },
            i = { "<cmd>NoNeckPainWidthUp<CR><cmd>NoNeckPainWidthUp<CR><cmd>NoNeckPainWidthUp<CR><cmd>NoNeckPainWidthUp<CR>",             "window size increse"   },
            d = { "<cmd>NoNeckPainWidthDown<CR><cmd>NoNeckPainWidthDown<CR><cmd>NoNeckPainWidthDown<CR><cmd>NoNeckPainWidthDown<CR>",     "window size decrese"   },
          },
        },
      })

      -- Zen Mode Toggle = Neotree Toggle
      vim.keymap.set("n", "<Leader>zz", function()
        if _G.zen_toggle == false then
          if _G.neotree_open == true then
            vim.api.nvim_command("Neotree toggle")
          end
          vim.api.nvim_command("NoNeckPain")
          vim.api.nvim_command("NoNeckPainResize 120")  -- customiz size...
          _G.zen_toggle = true
        else
          if _G.neotree_open == false then
            vim.api.nvim_command("Neotree left") -- restore left mode
          end
          vim.api.nvim_command("NoNeckPain")
          _G.zen_toggle = false
        end
      end, { desc = "toggle", noremap = true, silent = true })
    end,
  },

  {
    "folke/zen-mode.nvim",
    opts = {
    },

    config = function()
      -- set keymaps..
      vim.keymap.set("n", "<leader>zt",  "<cmd>ZenMode<CR>",      { desc = "zen mode" })

    end,
  },
}
