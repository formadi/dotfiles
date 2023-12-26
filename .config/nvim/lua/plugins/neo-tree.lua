return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "main",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  init = function()
    vim.g.neo_tree_remove_legacy_commands = true
  end,
  config = function()
    -- If you want icons for diagnostic errors, you'll need to define them somewhere:
    vim.fn.sign_define("DiagnosticSignError", {text = " ", texthl = "DiagnosticSignError"})
    vim.fn.sign_define("DiagnosticSignWarn",  {text = " ", texthl = "DiagnosticSignWarn"})
    vim.fn.sign_define("DiagnosticSignInfo",  {text = " ", texthl = "DiagnosticSignInfo"})
    vim.fn.sign_define("DiagnosticSignHint",  {text = "󰌵",  texthl = "DiagnosticSignHint"})

    require("neo-tree").setup({
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            -- hide cursor
            local hl = vim.api.nvim_get_hl_by_name('Cursor', true)
            hl.blend = 100
            vim.api.nvim_set_hl(0, 'Cursor', hl)
            vim.opt.guicursor:append('a:Cursor/lCursor')
            -- autocmd BufEnter normal! R
          end
        },
        {
          event = "neo_tree_buffer_leave",
          handler = function()
            -- show cursor
            local hl = vim.api.nvim_get_hl_by_name('Cursor', true)
            hl.blend = 0
            vim.api.nvim_set_hl(0, 'Cursor', hl)
            vim.opt.guicursor:remove('a:Cursor/lCursor')
          end
        }
      },

      filesystem = {
        filtered_items = {
          visible           = true,
          show_hidden_count = true,
          hide_dotfiles     = false,
          hide_gitignored   = true,
          never_show = {
            ".git",
            ".github",
            ".DS_Store",
            "thumbs.db",
          },
          never_show_by_pattern = {
            "*lock*",
          }
        },
      },

      window = {
        position = "left",     -- default mode
        popup = {               -- settings that apply to float position only
          size = { height = "25", width = "60" },
          position = "50%",      -- 50% means center it
        },
      },
    })

    -- set keymaps
    local wk = require("which-key")
    wk.register({
      ["<leader>"] = {
        e = {
          name = "Neotree",
          f = { "<cmd>Neotree float<CR>",         "float"   },
          l = { "<cmd>Neotree left<CR>",          "left"    },
          r = { "<cmd>Neotree right<CR>" ,        "right"   },
          e = { "<cmd>Neotree focus<CR>" ,        "focus"   },
          t = { "<cmd>Neotree toggle<CR>" ,       "toggle"  },
        },
      },
    })

    vim.keymap.set('n', '<leader>eb', function()
      local reveal_file = vim.fn.expand('%:p')
      if (reveal_file == '') then
        reveal_file = vim.fn.getcwd()
      else
        local f = io.open(reveal_file, "r")
        if (f) then
          f.close(f)
        else
          reveal_file = vim.fn.getcwd()
        end
      end
      require('neo-tree.command').execute({
        action = "focus",          -- OPTIONAL, this is the default value
        source = "filesystem",     -- OPTIONAL, this is the default value
        position = "left",        -- OPTIONAL, this is the default value
        reveal_file = reveal_file, -- path to file or folder to reveal
        reveal_force_cwd = true,   -- change cwd without asking if needed
      })
      end,
      {desc = "buffer's directory"}
    );

    -- customize highlight color
    vim.cmd([[ hi NeoTreeDotfile  guifg=#808080 ]])
  end,
}
