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
        ['core.journal'] = {
          config = {
            strategy = "flat",
          },
        },
        ['core.esupports.metagen'] = {
          config = {
            type = "auto", -- generates metadata if it is not present
          },
        },
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
        ["core.integrations.treesitter"] = {},
      },
    })

    -- set keymaps..
    local wk = require("which-key")
    wk.register({
      ["<leader>"] = {
        n = {
          name = "Neorg",
          n = { "<cmd>Neorg<CR>"                 ,                                    "popup"                    },
          c = { "<cmd>Neorg toggle-concealer<CR>",                                    "concealer"                },
          i = { "<cmd>Neorg index<CR>"           ,                                    "goto index"               },
          s = { "<cmd>Neorg generate-workspace-summary journal notes rust<CR>",       "generate index"           },  -- exclusive main
          k = {
            name = "Keybind",
            l = { "<cmd>Neorg keybind all core.looking-glass.magnify-code-block<CR>", "looking-glass"            },
            n = { "<cmd>Neorg keybind all core.dirman.new.note<CR>"                 , "new note"                 },
          },
          j = {
            name = "Journal",
            t = { "<cmd>Neorg journal today<CR>"    ,                                 "journal 'today'"          },
            y = { "<cmd>Neorg journal yesterday<CR>",                                 "journal 'yesterday'"      },
            n = { "<cmd>Neorg journal tomorrow<CR>" ,                                 "journal 'tomorrow'"       },
          },
          w = {
            name = "Workspace",
            r = { "<cmd>Neorg workspace rust<CR>"     ,                               "workspace 'rust'"         },
            n = { "<cmd>Neorg workspace notes<CR>"    ,                               "workspace 'notes'"        },
            j = { "<cmd>Neorg workspace journal<CR>"  ,                               "workspace 'journal'"      },
            m = { "<cmd>Neorg workspace main<CR>"  ,                                  "workspace 'main'"         },
          },
          m = {
            name = "Metagen",
            i = { "<cmd>Neorg inject-metadata<CR>" ,                                  "inject metadata"         },
            u = { "<cmd>Neorg update-metadata<CR>" ,                                  "update metadata"         },
          },
        },
      },
    })
  end,
}
