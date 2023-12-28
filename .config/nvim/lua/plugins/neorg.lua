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
              -- journal = "/Volumes/Kali/neorg/journal",
              notes   = "/Volumes/Kali/neorg/notes",
              rust    = "/Volumes/Kali/neorg/rust",
              blog    = "/Volumes/Kali/neorg/blog"
            },
            default_workspace = "main",
          },
        },
        ["core.summary"] = {
          config = {
            strategy = "default",
          },
        },
        ["core.integrations.treesitter"] = {},
      },
    })

    -- set keymaps..
    local wk = require("which-key")
    wk.register({
      ["<leader>"] = {
        n = {
          name = "Neorg",
          p = { "<cmd>Neorg<CR>",                                                    "show popup-menu"     },
          c = { "<cmd>Neorg toggle-concealer<CR>",                                   "toggle concealer"    },
          i = { "<cmd>Neorg index<CR>",                                              "show index"          },
          l = { "<cmd>Neorg keybind all core.looking-glass.magnify-code-block<CR>",  "run looking-glass"   },
          n = { "<cmd>Neorg keybind all core.dirman.new.note<CR>",                   "create new note"     },
          d = { "<cmd>Neorg keybind all core.tempus.insert-date-insert-mode<CR>",    "insert date"         },
          t = { "<cmd>Neorg toc<CR>",                                                "show toc"            },
          k = {
            name = "Keybind",
            t = { "<cmd>Neorg keybind all core.pivot.toggle-list-type<CR>",          "list type toggle"    },
          },
          j = {
            name = "Journal",
            t = { "<cmd>Neorg journal today<CR>"    ,                                "journal 'today'"     },
            y = { "<cmd>Neorg journal yesterday<CR>",                                "journal 'yesterday'" },
            n = { "<cmd>Neorg journal tomorrow<CR>" ,                                "journal 'tomorrow'"  },
          },
          m = {
            name = "Metagen",
            i = { "<cmd>Neorg inject-metadata<CR>" ,                                 "inject metadata"     },
            u = { "<cmd>Neorg update-metadata<CR>" ,                                 "update metadata"     },
          },
        },
      },
    })


    -- neorg main 의 하위 디렉토르를 확인한다.
    vim.keymap.set("n", "<Leader>nx", function()
      local neorg_module_dirman = require("neorg").modules.get_module("core.dirman")
      local ws           = neorg_module_dirman.get_current_workspace()
      -- example : ws = {"main, "/Volumes/Kali/neorg}
      -- :Neorg workspace 명령 실행
      -- local neorg_workspace_output = vim.cmd('Neorg workspace')

      -- 결과를 출력하거나 변수에 저장
      print("현재의 디렉토리 = " .. vim.inspect(ws))
      -- 또는
      -- local my_variable = neorg_workspace_output

    end, { desc = "debug", noremap = true, silent = true })



    -- neorg main 의 하위 디렉토르를 확인한다.
    vim.keymap.set("n", "<Leader>nw", function()
      function table.readdir(directory)
        local function explore(dir)
          local entries = vim.fn.readdir(dir)
          local result = {}

          for _, entry in ipairs(entries) do
            local full_path = dir .. '/' .. entry
            if vim.fn.isdirectory(full_path) == 1 then
              table.insert(result, full_path)
              -- 재귀적으로 디렉토리 탐색
              local subdirectories = explore(full_path)
              for _, subdirectory in ipairs(subdirectories) do
                table.insert(result, subdirectory)
              end
            end
          end
          return result
        end

        local full_directory = vim.fn.expand(directory)
        local directories = explore(full_directory)

        -- 상위 디렉토리 경로 제거
        local base_length = #full_directory + 1
        for i, dir in ipairs(directories) do
          directories[i] = string.sub(dir, base_length)
        end

        -- 앞의 '/' 제거
        for i, dir in ipairs(directories) do
          directories[i] = dir:gsub("^/", "")
        end

        -- "main" 항목 추가
        table.insert(directories, 1, 'main')


        -- 현재의 workspace를 확인
        local neorg_module_dirman = require("neorg").modules.get_module("core.dirman")
        local current_ws_table    = neorg_module_dirman.get_current_workspace()
        local current_ws          = current_ws_table[1]  -- table의 인텓스는 1부터 임.

        -- ws와 일치하는 항목은 빼 버린다.
         for i = #directories, 1, -1 do
            if directories[i] == current_ws then
              table.remove(directories, i)
            -- neorg 업데이트로 journal에는 접근할 수 없음
            -- main에서 직접 관리
            elseif directories[i] == "journal" then
                table.remove(directories, i)
            end
          end

        return directories
      end

      -- 사용자에게 디렉토리 선택 창 표시
      local function show_directory_selector(directories)
        local lines = vim.fn.map(directories, 'v:val')
        -- local content = table.concat(lines, '\n')
        local bufnr = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)

        -- 현재 활성 창 정보 가져오기
        local current_win = vim.fn.winnr()

        -- 현재 창의 너비와 높이 가져오기
        local win_width = vim.fn.winwidth(current_win)
        local win_height = vim.fn.winheight(current_win)

        -- 창의 가로, 세로 중앙 위치 계산
        local row = (win_height - #lines) / 2
        local col = (win_width - 30) / 2  -- 30은 창의 너비

        local neorg_module_dirman = require("neorg").modules.get_module("core.dirman")
        local current_ws_table    = neorg_module_dirman.get_current_workspace()
        local current_ws          = current_ws_table[1]  -- table의 인텓스는 1부터 임.

        local win_id = vim.api.nvim_open_win(bufnr, true, {
          -- 창 생성 옵션 설정
          relative = 'win',
          row = row,
          col = col,
          width = 30,
          height = #lines + 2,
          style = 'minimal',
          border = 'single',
          title = " Select a workspace : " .. current_ws .. " "
        })

        -- cursorline" 활성화
        vim.api.nvim_set_option_value( 'cursorline', true, {win = win_id} )

        -- 사용자가 선택한 디렉토리를 저장하는 전역 변수
        local selected_directory = nil

        -- 사용자가 선택한 디렉토리를 반환하는 함수
        local function on_select()
          vim.api.nvim_win_close(win_id, true)
          vim.cmd("Neorg workspace " .. selected_directory)
        end

        -- 키 매핑 설정
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<CR>', ':lua _G.on_select()<CR>', { noremap = true, silent = true })
        -- "Vq" 키로 창 닫기
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'q', ':lua _G.on_quit()<CR>', { noremap = true, silent = true })

        _G.on_select = function()
          local selected_line = tonumber(vim.fn.line('.'))
          selected_directory = directories[selected_line]
          on_select()
        end

        -- "q" 키로 창 닫기
        _G.on_quit = function()
          vim.api.nvim_win_close(win_id, true)
        end
      end

      -- 특정 디렉토리에서 하위 디렉토리 목록 가져오기
      local result = table.readdir('/Volumes/Kali/neorg')
      show_directory_selector(result)

    end, { desc = "change workspace", noremap = true, silent = true })




    -- Neorg 관련환
    -- index.norg 파일이 열리면.. index summary를 자동으로 갱신한다.
    function Norg_auto_indexing()
      -- 비동기적인 sleep 함수 정의
      local function sleep(ms, callback)
        vim.fn.timer_start(ms, function()
          callback()
        end)
      end

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


      -- local neorg_module_dirman = require("neorg").modules.get_module("core.dirman")
      -- local current_ws_table    = neorg_module_dirman.get_current_workspace()
      -- local current_ws          = current_ws_table[1]  -- table의 인텓스는 1부터 임.

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
        end

        vim.cmd("Neorg generate-workspace-summary")
      -- * Index 가 포함되어 있지 않은 경우..
      else
        -- print("해당 문자열이 포함된 라인이 없습니다.")
        if line_count == 9 then
          -- 빈 줄 2개 추가
          vim.api.nvim_buf_set_lines(0, line_count, line_count, false, {'', ''})
          -- "* Index" 추가
          vim.api.nvim_buf_set_lines(0, line_count + 1, line_count + 1, false, {'* Index'})
          -- Normal 모드로 변경하면서 "* Index"의 I 자리로 이동
          vim.api.nvim_command('normal! Gk')

          vim.cmd("Neorg generate-workspace-summary")
        end
      end

      -- 저장
      sleep(200, function()
        vim.cmd("w")
      end)

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
      autocmd BufRead index.norg lua Norg_auto_indexing()
    augroup END
    ]]

  end,
}
