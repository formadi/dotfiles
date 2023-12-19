-- set leader key to space
vim.g.mapleader = " "
local keymap = vim.keymap -- for conciseness

-- General Keymaps
vim.api.nvim_set_keymap("n", ";", ":",              { noremap = true, silent = false })

-- use jk to exit insert mode
keymap.set("i", "jk",         "<ESC>",              { desc = "Exit insert mode with jk" })
keymap.set("i", "<C-s>",      "<ESC>:w<CR>",        { desc = "Save" })

-- clear search highlights
keymap.set("n", "<leader>ch", ":nohl<CR>",          { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>",               { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>",               { desc = "Decrement number" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v",             { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s",             { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=",             { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>",     { desc = "Close current split" })

-- tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>",    { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>",  { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>",      { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>",      { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>",  { desc = "Open current buffer in new tab" })

-- retab
keymap.set("n", "<leader>rt", ":retab<CR>",         { desc = "retab" })

-- save & quit
keymap.set("n", "<leader>q",  ":q<CR>",             { desc = "Quit" })
keymap.set("n", "<leader>Q",  ":qa<CR>",            { desc = "Quit All" })
keymap.set("n", "<C-s>",      ":w<CR>",             { desc = "Save" })

-- indent
keymap.set("v", ">",          ">gv",                { desc = "Indent" })
keymap.set("v", "<",          "<gv",                { desc = "Indent" })

-- Lazy & Mason
keymap.set("n", "<leader>L",  "<cmd>Lazy<CR>",      { desc = "Lazy" })
keymap.set("n", "<leader>M",  "<cmd>Mason<CR>",     { desc = "Mason" })
