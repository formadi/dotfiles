
-- neorg의 workspace를 main으로 변경
-- -------------------------------------------------------------------------
local function change_ws_to_main ()
  vim.api.nvim_command("Neorg workspace main")  -- vim.cmd() 로는 오류가 난다. 아마두 0.10 이 후의 변화가 아닐까 ?
end


-- debug...
-- neorg main 의 하위 디렉토르를 확인한다.
vim.keymap.set("n", "<Leader>nx", function()
  -- local neorg_module_dirman = require("neorg").modules.get_module("core.dirman")
  -- local ws                  = neorg_module_dirman.get_current_workspace()
  -- example : ws = {"main, "/Volumes/Kali/neorg}
  -- :Neorg workspace 명령 실행
  -- local neorg_workspace_output = vim.cmd('Neorg workspace')
  -- 모든 버퍼의 ID 목록을 가져옵니다.
  local all_buffers = vim.api.nvim_list_bufs()
  -- 결과를 출력합니다.
  print("현재 윈도우에 연결된 버퍼의 수:", #all_buffers)
  -- 결과를 출력하거나 변수에 저장
  -- print("현재의 디렉토리 1 = " .. vim.inspect(ws))
  -- print("현재의 버퍼       = " .. #buffers)
  -- 또는
  -- local my_variable = neorg_workspace_output
end, { desc = "debug", noremap = true, silent = true })



-- keymaps... Neorg > journal > today
-- ---------------------------------------------------------------------------
vim.keymap.set("n", "<Leader>njt", function()
  local neorg_module_dirman = require("neorg").modules.get_module("core.dirman")
  local ws                  = neorg_module_dirman.get_current_workspace()

  if ws[1] ~= "main" then change_ws_to_main() end
  vim.api.nvim_command("Neorg journal today")
end, { desc = "journal today", noremap = true, silent = true })


-- keymap... Neorg > journal > yesterday
-- ---------------------------------------------------------------------------
vim.keymap.set("n", "<Leader>njy", function()
  local neorg_module_dirman = require("neorg").modules.get_module("core.dirman")
  local ws                  = neorg_module_dirman.get_current_workspace()

  if ws[1] ~= "main" then change_ws_to_main() end
  vim.api.nvim_command("Neorg journal yesterday")
end, { desc = "journal yesterday", noremap = true, silent = true })


-- keymap... Neorg > journal > tomorrow
-- ---------------------------------------------------------------------------
vim.keymap.set("n", "<Leader>njn", function()
  local neorg_module_dirman = require("neorg").modules.get_module("core.dirman")
  local ws                  = neorg_module_dirman.get_current_workspace()

  if ws[1] ~= "main" then change_ws_to_main() end
  vim.api.nvim_command("Neorg journal tomorrow")
end, { desc = "journal tommorow", noremap = true, silent = true })





-- keymap.. Noerg > workspace
-- ---------------------------------------------------------------------------
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
    local directories    = explore(full_directory)

    -- 상위 디렉토리 경로 제거
    local base_length = #full_directory + 1
    for i, dir in ipairs(directories) do
      directories[i] = string.sub(dir, base_length)
    end

    -- 폴더명에 포함된  '/'를 공백으로 변경
    for i, dir in ipairs(directories) do
      directories[i] = dir:gsub("^/", " ")
    end

    -- "main" 항목 추가
    table.insert(directories, 1, ' main')

    -- 현재의 workspace를 확인
    local neorg_module_dirman = require("neorg").modules.get_module("core.dirman")
    local current_ws_table    = neorg_module_dirman.get_current_workspace()
    local current_ws          = current_ws_table[1]  -- table의 인텓스는 1부터 임.
    local ws                  = " " .. current_ws
    -- ws와 일치하는 항목은 빼 버린다.
     for i = #directories, 1, -1 do
        if directories[i] == ws then
          table.remove(directories, i)
          -- neorg 업데이트로 journal에는 접근할 수 없음
          -- main에서 직접 관리
          -- elseif directories[i] == "journal" then
              -- table.remove(directories, i)
        end
      end

    return directories
  end


  -- 사용자에게 디렉토리 선택 창 표시
  -- ---------------------------------------------------------------------------
  local function show_directory_selector(directories)
    local lines = vim.fn.map(directories, 'v:val')
    -- local content = table.concat(lines, '\n')
    local bufnr = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
    -- 현재 활성 창 정보 가져오기
    local current_win = vim.fn.winnr()
    -- 현재 창의 너비와 높이 가져오기
    local win_width  = vim.fn.winwidth(current_win)
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
      row      = row,
      col      = col,
      width    = 30,
      height   = #lines + 2,
      style    = 'minimal',
      border   = 'single',
      title    = " Select a workspace : " .. current_ws .. " "
    })

    -- cursorline" 활성화
    vim.api.nvim_set_option_value( 'cursorline', true, {win = win_id} )

    -- 사용자가 선택한 디렉토리를 저장하는 전역 변수
    local selected_directory = nil

    -- 사용자가 선택한 디렉토리를 반환하는 함수
    local function on_select()
      vim.api.nvim_win_close(win_id, true)  -- workspace 선택 창을 닫는다 .
      vim.api.nvim_command("Neorg workspace" .. selected_directory)
    end

    -- 키 매핑 설정
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<CR>', ':lua _G.on_select()<CR>', { noremap = true, silent = true })
    -- "Vq" 키로 창 닫기
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'q', ':lua _G.on_quit()<CR>', { noremap = true, silent = true })

    _G.on_select = function()
      local selected_line = tonumber(vim.fn.line('.'))
      selected_directory = directories[selected_line]
      on_select()  -- call local function on_select()
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



-- --------------------------------------------------------------------------------------------
-- index.norg 파일이 열리면.. index summary를 자동으로 갱신한다.
function Norg_auto_indexing()
  -- 비동기적인 sleep 함수 정의
  local function sleep(ms, callback)
    vim.fn.timer_start(ms, function()
      callback()
    end)
  end

  vim.api.nvim_out_write("index.norg 파일이 열렸습니다!") -- print 는 notify의 message로 출력된다.
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
    print("해당 문자열이 포함된 라인:", target_line_number)
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
    print("해당 문자열이 포함된 라인이 없습니다.")
    -- metadata의 마지막 라인으로 이동한다. : line 9
    vim.api.nvim_win_set_cursor(0, {9, 0})

    -- 빈 줄 1개 추가
    vim.api.nvim_buf_set_lines(0, 9, 9, false, {''})
    -- 현재 위치에서 한 줄 아래로 이동
    vim.cmd('normal! j')
    -- 시각 모드(V-모드)로 전환하여 파일 끝까지 선택
    vim.cmd('normal! VG')
    -- 선택된 텍스트 삭제
    vim.cmd('normal! d')

    -- if line_count == 9 then
      -- 빈 줄 2개 추가
      vim.api.nvim_buf_set_lines(0, line_count, line_count, false, {'', ''})
      -- "* Index" 추가
      vim.api.nvim_buf_set_lines(0, line_count + 1, line_count + 1, false, {'* Index'})
      -- Normal 모드로 변경하면서 "* Index"의 I 자리로 이동
      vim.api.nvim_command('normal! Gk')

      vim.api.nvim_command("Neorg generate-workspace-summary")
    -- end
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
-- ------------------------------------------------------------------------
vim.cmd [[
augroup norg_auto_indexing
  autocmd!
  autocmd BufRead  index.norg lua Norg_auto_indexing()
augroup END
]]



-- norg 확장자의 파일을 열 경우, line number를 숨긴다.
-- -----------------------------------------------------------------------
-- line number 감추기 여부를 결정할 함수
function ShouldHideLineNumber()
    -- 현재 buffer의 확장자 가져오기
    local file_extension = vim.fn.expand("%:e")

    -- 파일 확장자가 "norg"인 경우에는 line number 감춤
    return file_extension == "norg"
end

-- line number 감춤 여부 설정
function ToggleLineNumber()
    -- if ShouldHideLineNumber() then
    if vim.bo.filetype == 'norg' then
      vim.wo.number = false
    else
      vim.wo.number = true
    end
end

-- BufferWritePost 이벤트에 대한 autocmd 추가
vim.cmd(
    [[
    augroup HideLineNumber
        autocmd!
        autocmd BufReadPost * lua ToggleLineNumber()
    augroup END
    ]],
    false
)
