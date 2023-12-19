return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup ({
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
 				["core.ui"] = {},
				-- ["core.ui.calendar"] = {},
				-- ["core.tempus"] = {},
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              main    = "/Volumes/Kali/neorg",
              journal = "/Volumes/Kali/neorg/journal",
              notes   = "/Volumes/Kali/neorg/notes",
              rust    = "/Volumes/Kali/neorg/rust",
            },
            default_workspace = "main",
          },
        },
        ["core.summary"] = {},
      },
    })

    -- set keymaps..
    local wk = require("which-key")
    wk.register({
      ["<leader>"] = {
        n = {
          name = "Noice / Neorg",
          n = { "<cmd>Neorg<CR>"                 , "Neorg" },
          c = { "<cmd>Neorg toggle-concealer<CR>", "Neorg toggle concealer" },
          i = { "<cmd>Neorg index<CR>"           , "Neorg index" },
          k = {
            name = "Neorg keybind",
            l = { "<cmd>Neorg keybind all core.looking-glass.magnify-code-block<CR>", "Neorg looking-glass"},
            n = { "<cmd>Neorg keybind all core.dirman.new.note<CR>"                 , "Neorg new note"     },
          },
          j = {
            name = "Neorg Journal",
            t = { "<cmd>Neorg journal today<CR>"    , "journal 'today'"     },
            y = { "<cmd>Neorg journal yesterday<CR>", "journal 'yesterday'" },
            n = { "<cmd>Neorg journal tomorrow<CR>" , "journal 'tomorrow'"  },
          },
          w = {
            name = "Neorg Workspace",
            r = { "<cmd>Neorg workspace rust<CR>"     , "workspace 'rust'"         },
            n = { "<cmd>Neorg workspace notes<CR>"    , "workspace 'notes(main)'"  },
          --   k = { "<cmd>Neorg workspace knowledge_base<CR>" , "workspace 'knowledge base'"  },
          --   c = { "<cmd>Neorg workspace config<CR>"         , "workspace 'config'"          },
          },
        },
      },
    })
  end,
}
