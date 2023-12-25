-- set leader key to space
vim.g.mapleader = " "        -- space key
local keymap    = vim.keymap -- for conciseness

-- General Keymaps
vim.api.nvim_set_keymap("n", ";", ":",                { noremap = true, silent = false    })

-- use jk to exit insert mode
keymap.set("i", "jk",              "<ESC>",           { desc = "exit insert mode with jk" })
keymap.set("i", "<C-s>",           "<ESC>:w<CR>",     { desc = "save"                     })

-- clear search highlights
keymap.set("n", "<leader>c",       ":nohl<CR>",       { desc = "clear search highlights"  })

-- increment/decrement numbers
keymap.set("n", "<leader>+",       "<C-a>",           { desc = "increment number"         })
keymap.set("n", "<leader>-",       "<C-x>",           { desc = "decrement number"         })

-- windows & tabs
-- Refer to nvim/lua/lougins/which-key.nim
keymap.set("n", "<leader>w<Up>",    "<C-w>k",         { desc = "move to upper window"     })
keymap.set("n", "<leader>w<Down>",  "<C-w>j",         { desc = "move to lower window"     })
keymap.set("n", "<leader>w<Left>",  "<C-w>h",         { desc = "move to left window"      })
keymap.set("n", "<leader>w<Right>", "<C-w>l",         { desc = "move to right window"     })

-- retab
-- keymap.set("n", "<leader>r",       ":retab<CR>",      { desc = "retab"                    })

-- save & quit
keymap.set("n", "<leader>q",       ":q<CR>",          { desc = "quit"                     })
keymap.set("n", "<leader>Q",       ":qa<CR>",         { desc = "quit All"                 })
keymap.set("n", "<C-s>",           ":w<CR>",          { desc = "save"                     })

-- indent
keymap.set("v", ">",               ">gv",             { desc = "> indent"                 })
keymap.set("v", "<",               "<gv",             { desc = "< indent"                 })

-- Lazy & Mason
keymap.set("n", "<leader>L",       "<cmd>Lazy<CR>",   { desc = "lazy"                     })
keymap.set("n", "<leader>M",       "<cmd>Mason<CR>",  { desc = "mason"                    })

-- Noraml Mode.
keymap.set("n", "<leader>i", ":call append(line('.'), '')<CR>", {desc = "add newline"     })
