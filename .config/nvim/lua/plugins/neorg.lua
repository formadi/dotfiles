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
				["core.ui.calendar"] = {},
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
              blog    = "/Volumes/Kali/neorg/blog"
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
          p = { "<cmd>Neorg<CR>"                 ,                                   "popup"                    },
          c = { "<cmd>Neorg toggle-concealer<CR>",                                   "concealer"                },
          i = { "<cmd>Neorg index<CR>"           ,                                   "goto index"               },
          s = { "<cmd>Neorg generate-workspace-summary<CR>", "generate index"           },  -- exclusive main , journal notes blog rust
          l = { "<cmd>Neorg keybind all core.looking-glass.magnify-code-block<CR>" , "looking-glass"            },
          n = { "<cmd>Neorg keybind all core.dirman.new.note<CR>"                  , "new note"                 },
          d = { "<cmd>Neorg keybind all core.tempus.insert-date-insert-mode<CR>"   , "insert date"              },
          t = { "<cmd>Neorg toc<CR>"                                               , "toc"                      },
          k = {
            name = "keybind",
            t = { "<cmd>Neorg keybind all core.pivot.toggle-list-type<CR>"         , "list type toggle"         },
          },
          j = {
            name = "Journal",
            t = { "<cmd>Neorg journal today<CR>"    ,                                 "journal 'today'"          },
            y = { "<cmd>Neorg journal yesterday<CR>",                                 "journal 'yesterday'"      },
            n = { "<cmd>Neorg journal tomorrow<CR>" ,                                 "journal 'tomorrow'"       },
          },
          w = {
            name = "Workspace",
            r = { "<cmd>Neorg workspace rust<CR>"     ,                               "rtst"                     },
            n = { "<cmd>Neorg workspace notes<CR>"    ,                               "notes"                    },
            j = { "<cmd>Neorg workspace journal<CR>"  ,                               "journal"                  },
            m = { "<cmd>Neorg workspace main<CR>"     ,                               "main"                     },
            b = { "<cmd>Neorg workspace blog<CR>"     ,                               "blog"                     },
          },
          m = {
            name = "Metagen",
            i = { "<cmd>Neorg inject-metadata<CR>" ,                                  "inject metadata"          },
            u = { "<cmd>Neorg update-metadata<CR>" ,                                  "update metadata"          },
          },
        },
      },
    })

    -- <leader>nui 를 누르면, 자동으로 index를 재 생성해 준다.
    -- 단 * index 요 위에 커서를 올려 놓은 상태에서 해야 한다.
    vim.keymap.set("n", "<Leader>nu", function()
        -- 현재 위치에서 한 줄 아래로 이동
        vim.cmd('normal! j')
        -- 시각 모드(V-모드)로 전환하여 파일 끝까지 선택
        vim.cmd('normal! VG')
        -- 선택된 텍스트 삭제
        vim.cmd('normal! d')
        -- "ns" 키 입력
        vim.cmd("Neorg generate-workspace-summary")
    end, { desc = "update index", noremap = true, silent = true })
  end,
}
