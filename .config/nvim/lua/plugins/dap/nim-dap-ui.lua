return {
  "rcarriga/nvim-dap-ui",
  requires = { "mfussenegger/nvim-dap"},
  config = function()

    require("dapui").setup ()

      local dap = require("dap")
      local dapui = require("dapui")

      dap.listeners.after.event_initialized["depui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["depui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- set keymaps
      -- vim.keymap.set("n", "<leader>dt", ':DapToggleBreakpoint<CR>',  { desc = "DAP - toggle break point"})
      vim.keymap.set("n", "<leader>dx", ':DapTerminate<CR>'       ,  { desc = "DAP - terminate"})
      -- vim.keymap.set("n", "<leader>do", ':DapStepOver<CR>'        ,  { desc = "DAP - step over"})
      vim.keymap.set("n", "<leader>dc", "<Cmd>lua require'dap'.continue()<CR>"          ,  { desc = "DAP - continue"})
      vim.keymap.set("n", "<leader>do", "<Cmd>lua require'dap'.step_over()<CR>"         ,  { desc = "DAP - step over"})
      vim.keymap.set("n", "<leader>di", "<Cmd>lua require'dap'.step_into()<CR>"         ,  { desc = "DAP - step into"})
      vim.keymap.set("n", "<leader>dt", "<Cmd>lua require'dap'.step_out()<CR>"          ,  { desc = "DAP - step out"})
      vim.keymap.set("n", "<leader>db", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>" ,  { desc = "DAP - toggle breakpoint"})

  end,
}
