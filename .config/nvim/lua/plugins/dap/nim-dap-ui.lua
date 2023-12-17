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

      vim.keymap.set("n", "<leader>dt", ':DapToggleBreakpoint<CR>')
      vim.keymap.set("n", "<leader>dx", ':DapTerminate<CR>')
      vim.keymap.set("n", "<leader>do", ':DapStepOver<CR>')

  end,
}
