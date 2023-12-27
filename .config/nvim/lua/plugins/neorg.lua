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
          i = {
            name = "Index",
            i = { "<cmd>Neorg index<CR>"         ,                                   "goto index"               },
            g = { "<cmd>Neorg generate-workspace-summary<CR>",                       "generate index"           },  -- exclusive main , journal notes blog rust
          },
          l = { "<cmd>Neorg keybind all core.looking-glass.magnify-code-block<CR>" , "looking-glass"            },
          n = { "<cmd>Neorg keybind all core.dirman.new.note<CR>"                  , "new note"                 },
          d = { "<cmd>Neorg keybind all core.tempus.insert-date-insert-mode<CR>"   , "insert date"              },
          t = { "<cmd>Neorg toc<CR>"                                               , "toc"                      },
          k = {
            name = "Keybind",
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
            r = { "<cmd>Neorg workspace rust<CR>"     ,                               "rust"                     },
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
    vim.keymap.set("n", "<Leader>niu", function()
        -- 현재 위치에서 한 줄 아래로 이동
        vim.cmd('normal! j')
        -- 시각 모드(V-모드)로 전환하여 파일 끝까지 선택
        vim.cmd('normal! VG')
        -- 선택된 텍스트 삭제
        vim.cmd('normal! d')
        -- "ns" 키 입력
        vim.cmd("Neorg generate-workspace-summary")
    end, { desc = "update index", noremap = true, silent = true })



    -- Neorg 관련
    -- index.norg 파일이 열리면.. index summary를 자동으로 갱신한다.
    function Norg_auto_indexing()
      -- print("index.norg 파일이 열렸습니다!") -- print 는 notify의 message로 출력된다.
      -- 현재 버퍼의 라인 수 가져오기
      local line_count = vim.fn.line("$")

      -- 특정 문자열이 포함된 라인 찾기
      local target_pattern     = "* Index"
      local target_line_number = nil
      local start_index        = 0

      for i = 1, line_count do
        local line_content = vim.fn.getline(i)
        local found_start  = string.find(tostring(line_content), target_pattern)
        if found_start then
          start_index        = found_start
          target_line_number = i
          break
        end
      end

      -- 특정 문자열이 포함된 라인이 있는지 확인
      if target_line_number then
        -- print("해당 문자열이 포함된 라인:", target_line_number)
        -- 해당 라인으로 커서 이동
        vim.api.nvim_win_set_cursor(0, {target_line_number, start_index - 1})

        if line_count > target_line_number then
          -- 현재 위치에서 한 줄 아래로 이동
          vim.cmd('normal! j')
          -- 시각 모드(V-모드)로 전환하여 파일 끝까지 선택
          vim.cmd('normal! VG')
          -- 선택된 텍스트 삭제
          vim.cmd('normal! d')
          -- "ns" 키 입력
          vim.cmd("Neorg generate-workspace-summary")
        else
          -- "ns" 키 입력
          vim.cmd("Neorg generate-workspace-summary")
        end
      else
        -- print("해당 문자열이 포함된 라인이 없습니다.")
        if line_count == 9 then
          -- 빈 줄 2개 추가
          vim.api.nvim_buf_set_lines(0, line_count, line_count, false, {'', ''})
          -- "* Index" 추가
          vim.api.nvim_buf_set_lines(0, line_count + 1, line_count + 1, false, {'* Index'})
          -- Normal 모드로 변경하면서 "* Index"의 I 자리로 이동
          vim.api.nvim_command('normal! Gk')
          -- "ns" 키 입력
          vim.cmd("Neorg generate-workspace-summary")
        end
      end

      -- [index] 가 포함된 라인을 제거 한다.
      line_count     = vim.fn.line("$")
      target_pattern = "%[Index%]"
      for i = line_count, 1, -1 do
        local line_content = vim.fn.getline(i)
        local index_start = string.find(tostring(line_content), target_pattern)
        if index_start then
          -- 해당 라인 삭제
          -- print("해당 라인을 발견 함")
          vim.api.nvim_buf_set_lines(0, i-1, i, false, {})
        end
      end
    end

    -- autocmd 등록
    -- BufEnter는 파일이 열린 후를 의미한다.
    vim.cmd [[
    augroup norg_auto_indexing
      autocmd!
      autocmd BufEnter index.norg lua Norg_auto_indexing()
    augroup END
    ]]

  end,
}
