
return {
  "kdheepak/tabline.nvim",
  config = function()
    require("tabline").setup({
      enable = false,
      options = {
        section_separators     = {'', ''},
        component_separators   = {'', ''},
        max_bufferline_percent = 0,   -- 0%, only display current buffer
        show_tabs_always       = false,
        show_devicons          = true,
        show_filename_only     = true,
        show_tabs_only         = true,
      },
    })
  end,
}
