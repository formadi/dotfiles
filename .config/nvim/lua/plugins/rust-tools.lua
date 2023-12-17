return {
  "simrat39/rust-tools.nvim",
  ft = "rust",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
    "mfussenegger/nvim-dap",
  },
  config = function()
    local rt             = require("rust-tools")
    local mason_registry = require("mason-registry")
    local codelldb       = mason_registry.get_package("codelldb")
    local extension_path = codelldb:get_install_path() .. "/extension/"
    local codelldb_path  = extension_path .. "adapter/codelldb"
    local liblldb_path   = extension_path .. "lldb/lib/liblldb.dylib"

    rt.setup ({
      dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
      },
      server = {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach    = function (_, bufnr)
          -- Hover actions
          vim.keymap.set("n", "<leader>rh", rt.hover_actions.hover_actions,         { buffer = bufnr, desc = "rust hover action" })
          vim.keymap.set("n", "<leader>rc", rt.code_action_group.code_action_group, { buffer = bufnr, desc = "rust  code action" })
        end,
      },
      tools = {
        hover_actions = {
          auto_focus = true,
        },
      },
    })
  end,
}
