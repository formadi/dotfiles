-- set leader key to space
vim.g.mapleader = " "
local keymap = vim.keymap -- for conciseness

-- General Keymaps
vim.api.nvim_set_keymap("n", ";",          ":",                  { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<leader>tw", [[:%s/\s\+$//e<CR>]], { noremap = true, silent = true })

-- use jk to exit insert mode
keymap.set("i", "jk",         "<ESC>",              { desc = "Exit insert mode with jk" })
keymap.set("i", "<C-s>",      "<ESC>:w<CR>",        { desc = "Save" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>",          { desc = "Clear search highlights" })

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

-- save & quit
keymap.set("n", "<leader>q",  ":q<CR>",             { desc = "Quit" })
keymap.set("n", "<leader>Q",  ":qa<CR>",            { desc = "Quit All" })
keymap.set("n", "<C-s>",      ":w<CR>",             { desc = "Save" })

-- laztgit
keymap.set("n", "<leader>lg", "<cmd>LazyGit<CR>",   { desc = "lazygit" })

-- indent
keymap.set("v", ">",          ">gv",                { desc = "Indent" })
keymap.set("v", "<",          "<gv",                { desc = "Indent" })


