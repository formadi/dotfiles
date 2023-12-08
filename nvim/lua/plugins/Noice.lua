return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  event = "VeryLazy",
  config = function()
    require("noice").setup({
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        hover     = { enabled = true },
        signature = { enabled = true },
        progress  = {
          enabled     = true,
          format      = "lsp_progress",
          format_done = "lsp_progress_done",
          throttle    = 1000 / 30, -- frequency to update lsp progress message
          view = "mini",
        },
      },
      presets = {
        bottom_search         = false,  -- use a classic bottom cmdline for search
        command_palette       = false,  -- position the cmdline and popupmenu together
        long_message_to_split = true,   -- long messages will be sent to a split
        inc_rename            = false,  -- enables an input dialog for inc-rename.nvim
        lsp_doc_border        = true,   -- add a border to hover docs and signature help
      },
    })

    vim.notify = require("notify")
    require("notify").setup({
      background_colour = "Normal",
      fps = 60,
      icons = {
        DEBUG = " ",
        ERROR = " ",
        INFO  = "􁊈 ",
        TRACE = "✎",
        WARN  = " ",
      },
      level         = 2, -- display level
      minimum_width = 50,
      maximum_width = 50,
      render        = "default",
      stages        = "slide",
      timeout       = 6000,
    })
  end,
}
