return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- set keymaps
    -- local keymap = vim.keymap -- for conciseness
    --
    -- keymap.set(
    --   "n",
    --   "<leader>hm",
    --   "<cmd>lua require('harpoon.mark').add_file()<cr>",
    --   { desc = "Mark file with harpoon" }
    -- )
    -- keymap.set("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Go to next harpoon mark" })
    -- keymap.set(
    --   "n",
    --   "<leader>hp",
    --   "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
    --   { desc = "Go to previous harpoon mark" }
    -- )
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end, {desc = "harpoon append"})
    vim.keymap.set("n", "<leader>hr", function() harpoon:list():remove() end, {desc = "harpoon remove"})
    vim.keymap.set("n", "<leader>hc", function() harpoon:list():clear()  end, {desc = "harpoon clear(remove all)"})

    vim.keymap.set("n", "<leader>hn", function() harpoon:list():next()   end, {desc = "harpoon next"})
    vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev()   end, {desc = "harpoon prev"})

    vim.keymap.set("n", "<leader>hq", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "harpoon quick menu"})

    -- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
    -- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
    -- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
    -- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
  end,
}
