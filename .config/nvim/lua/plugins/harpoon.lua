return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    -- set keymaps
    local wk = require("which-key")
    wk.register({
      ["<leader>"] = {
        h = {
          name = "Harpoon",
        },
      },
    })

    vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end, {desc = "append"})
    vim.keymap.set("n", "<leader>hr", function() harpoon:list():remove() end, {desc = "remove"})
    vim.keymap.set("n", "<leader>hc", function() harpoon:list():clear()  end, {desc = "clear (remove all)"})
    vim.keymap.set("n", "<leader>hn", function() harpoon:list():next()   end, {desc = "jump next"})
    vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev()   end, {desc = "jump prev"})
    vim.keymap.set("n", "<leader>hq", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "show quick menu"})
  end,
}


-- return {
--   "Pheon-Dev/buffalo-nvim",
--   config = function()
--     require("buffalo").setup({})
--
--
--     local opts = { noremap = true }
--     local map = vim.keymap.set
--     local buffalo = require("buffalo.ui")
--
--     -- buffers
--     map({ 't', 'n' }, 'bb', buffalo.toggle_buf_menu, opts)
--
--     map('n', '<C-j>', buffalo.nav_buf_next, opts)
--     map('n', '<C-k>', buffalo.nav_buf_prev, opts)
--
--     -- tabpages
--     map({ 't', 'n' }, 'bt', buffalo.toggle_tab_menu, opts)
--
--     map('n', '<C-n>', buffalo.nav_tab_next, opts)
--     map('n', '<C-p>', buffalo.nav_tab_prev, opts)
--     -- harpoon:setup()
--     --
--     -- -- set keymaps
--     -- vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end, {desc = "harpoon append"})
--     -- vim.keymap.set("n", "<leader>hr", function() harpoon:list():remove() end, {desc = "harpoon remove"})
--     -- vim.keymap.set("n", "<leader>hc", function() harpoon:list():clear()  end, {desc = "harpoon clear(remove all)"})
--     --
--     -- vim.keymap.set("n", "<leader>hn", function() harpoon:list():next()   end, {desc = "harpoon next"})
--     -- vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev()   end, {desc = "harpoon prev"})
--     --
--     -- vim.keymap.set("n", "<leader>hq", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "harpoon quick menu"})
--   end,
-- }
