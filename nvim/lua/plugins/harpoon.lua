return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end, {desc = "harpoon append"})
    vim.keymap.set("n", "<leader>hr", function() harpoon:list():remove() end, {desc = "harpoon remove"})
    vim.keymap.set("n", "<leader>hc", function() harpoon:list():clear()  end, {desc = "harpoon clear(remove all)"})

    vim.keymap.set("n", "<leader>hn", function() harpoon:list():next()   end, {desc = "harpoon next"})
    vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev()   end, {desc = "harpoon prev"})

    vim.keymap.set("n", "<leader>hq", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "harpoon quick menu"})
  end,
}
