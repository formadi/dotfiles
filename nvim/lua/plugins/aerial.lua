return {
	"stevearc/aerial.nvim",
	opts = {
		attach_mode = "global",
		backends = { "lsp", "treesitter", "markdown", "man", "objc" },
		show_guides = true,
		guides = {
			mid_item = "├ ",
			last_item = "└ ",
			nested_top = "│ ",
			whitespace = "  ",
		},
	},
	config = function()
		require("aerial").setup({
			-- optionally use on_attach to set keymaps when aerial has attached to a buffer
			on_attach = function(bufnr)
				-- Jump forwards/backwards with '{' and '}'
				vim.keymap.set("n", "{", "<cmd>aerial prev<CR>", { buffer = bufnr })
				vim.keymap.set("n", "}", "<cmd>aerial next<CR>", { buffer = bufnr })
			end,
			-- Highlight the closest symbol if the cursor is not exactly on one.
			highlight_closest = true,
		})

		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>", { desc = "Aerial Toggle" })
	end,
}
