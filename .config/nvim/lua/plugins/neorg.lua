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
    local wk = require("which-key")
    wk.register({
      ["<leader>"] = {
        n = {
          name = "Noice / Neorg",
          j = {
            name = "Neorg Journal",
            t = { "<cmd>Neorg journal today<CR>"    , "journal 'today'"     },
            y = { "<cmd>Neorg journal yesterday<CR>", "journal 'yesterday'" },
            n = { "<cmd>Neorg journal tomorrow<CR>" , "journal 'tomorrow'"  },
          },
          w = {
            name = "Neorg Workspace",
            w = { "<cmd>Neorg workspace work_notes<CR>"     , "workspace 'work notes'"      },
            m = { "<cmd>Neorg workspace main<CR>"           , "workspace 'main'"            },
            k = { "<cmd>Neorg workspace knowledge_base<CR>" , "workspace 'knowledge base'"  },
            c = { "<cmd>Neorg workspace config<CR>"         , "workspace 'config'"          },
          },
        },
      },
    })
  end,
}
