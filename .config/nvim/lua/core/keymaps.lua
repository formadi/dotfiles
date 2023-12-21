-- set leader key to space
vim.g.mapleader = " "
local keymap = vim.keymap -- for conciseness

-- General Keymaps
vim.api.nvim_set_keymap("n", ";", ":",              { noremap = true, silent = false })

-- use jk to exit insert mode
keymap.set("i", "jk",         "<ESC>",              { desc = "exit insert mode with jk" })
keymap.set("i", "<C-s>",      "<ESC>:w<CR>",        { desc = "save" })

-- clear search highlights
keymap.set("n", "<leader>c", ":nohl<CR>",          { desc = "clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>",               { desc = "increment number" })
keymap.set("n", "<leader>-", "<C-x>",               { desc = "decrement number" })


-- retab
keymap.set("n", "<leader>r", ":retab<CR>",          { desc = "retab" })

-- save & quit
keymap.set("n", "<leader>q",  ":q<CR>",             { desc = "quit" })
keymap.set("n", "<leader>Q",  ":qa<CR>",            { desc = "quit All" })
keymap.set("n", "<C-s>",      ":w<CR>",             { desc = "save" })

-- indent
keymap.set("v", ">",          ">gv",                { desc = "> indent" })
keymap.set("v", "<",          "<gv",                { desc = "< indent" })

-- Lazy & Mason
keymap.set("n", "<leader>L",  "<cmd>Lazy<CR>",      { desc = "lazy" })
keymap.set("n", "<leader>M",  "<cmd>Mason<CR>",     { desc = "mason" })
