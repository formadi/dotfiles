return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine     = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count
    local utils       = require("core.utils")

    local colors = {
      blue        = "#65D1FF",
      green       = "#3EFFDC",
      violet      = "#FF61EF",
      yellow      = "#FFDA7B",
      red         = "#FF4A4A",
      fg          = "#c3ccdc",
      bg          = "#112638",
      inactive_bg = "#2c3043",
    }

    local custom_theme = {
      normal = {
        a = { bg = colors.blue,   fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg,     fg = colors.fg },
        c = { bg = colors.bg,     fg = colors.fg },
      },
      insert = {
        a = { bg = colors.green,  fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg,     fg = colors.fg },
        c = { bg = colors.bg,     fg = colors.fg },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg,     fg = colors.fg },
        c = { bg = colors.bg,     fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg,     fg = colors.fg },
        c = { bg = colors.bg,     fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red,    fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg,     fg = colors.fg },
        c = { bg = colors.bg,     fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
        b = { bg = colors.inactive_bg, fg = colors.semilightgray },
        c = { bg = colors.inactive_bg, fg = colors.semilightgray },
      },
    }

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = custom_theme,
        component_separators = '|',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = { 'filename', 'branch' },
        lualine_c = {}, -- { 'fileformat', { unix =" " } },
        lualine_x = {
          -- { "aerial" },
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          -- { "encoding" },
          { "fileformat", symbols = { unix =" " } },
        },
        lualine_y = {}, -- { 'filetype', 'progress' },
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {
          -- {
          --   require("noice").api.status.message.get_hl,
          --   cond = require("noice").api.status.message.has,
          -- },
        },
        lualine_x = { utils.getWords },
        lualine_y = { { 'aerial', sep=' | ' }, 'filetype' },
        lualine_z = {'progress'}
      },
      extensions = {},
    })
  end,
}
