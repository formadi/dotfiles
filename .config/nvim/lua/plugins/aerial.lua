return {
  "stevearc/aerial.nvim",

  config = function()
    require("aerial").setup({
      attach_mode = "global",
      backends = {
        ['_']  = {"lsp", "treesitter", "markdown", "man" },
        python = {"treesitter"},
        swift  = {"lsp"},
      },

      -- backends = { "lsp", "treesitter", "markdown", "man" },
      show_guides = true,
      guides = {
        mid_item   = "├ ",
        last_item  = "└ ",
        nested_top = "│ ",
        whitespace = "  ",
      },

      -- nerd_font = "Hack Nerd Font",

      -- optionally use on_attach to set keymaps when aerial has attached to a buffer
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "{", "<cmd>aerial prev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>aerial next<CR>", { buffer = bufnr })
      end,
      -- Highlight the closest symbol if the cursor is not exactly on one.
      highlight_closest = true,
    })

    -- set keymaps
    vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>", { desc = "toggle aerial" })
  end,
}
