return {
  "FabianWirth/search.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },

  config = function()
    local builtin = require('telescope.builtin')

    require("search").setup ({
      tabs = {
        {
          name = "Grep",
          tele_func = builtin.live_grep, -- find_files,
        },
        {
          name = "Files",
          tele_func = builtin.find_files,
        },
        {
          name = "Buffers",
          tele_func = builtin.buffers,
        },
        {
          name = "Keymaps",
          tele_func = builtin.keymaps,
        },
        {
          name = "Hightlight",
          tele_func = builtin.highlights,
        },
      },
    })

    -- set keymaps
    local search = require("search")
    vim.keymap.set("n", "<leader>ss", function() search.open() end, {desc = "search"})
  end,
}
