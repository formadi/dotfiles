-- catppuccin ,  everforest  , nord , iceberg , vscode , poimandres , monochrome
_G.color_scheme_name = "catppuccin"
_G.color_scheme      = nil
_G.zen_toggle        = false
_G.working_directory = vim.fn.getcwd()
_G.neotree_open      = false

require("core")

-- for image.nvim
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

vim.g.python3_host_prog    = "/Users/elsa/.config/venv/bin/python3"
vim.g.loaded_perl_provider = 0

-- ### when using neovide.app
-- ------------------------------------------------------------
-- if vim.g.neovide then
--   vim.o.guifont = "Sarasa Term K Nerd Font ExtraLight:h12"
--   vim.g.neovide_padding_top   = 10
--   vim.g.neovide_padding_down  = 10
--   vim.g.neovide_padding_left  = 10
--   vim.g.neovide_padding_right = 10
--
--   local alpha = function ()
--     return string.format("%x", math.floor(0.8))
--   end
--
--   vim.g.neovide_transparency = 0.0
--   vim.g.tranparency = 1.0
--   vim.g.neovide_background_color = "#242e41" .. alpha()
-- end


-- If you need to verify whether image.nvim is functioning correctly
-- ------------------------------------------------------------------
-- vim.opt.number = true
-- vim.opt.conceallevel = 2
-- vim.opt.winbar = "image.nvim demo"
-- vim.opt.signcolumn = "yes:2"
-- local content = [[
-- # Hello World
--
-- ![This is a remote image](https://gist.ro/s/remote.png)
-- ]]
--
-- vim.schedule(function()
--   local buf = vim.api.nvim_create_buf(false, true)
--   vim.api.nvim_buf_set_lines(buf, 0, -1, true, vim.split(content, "\n"))
--   vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
--   vim.api.nvim_set_current_buf(buf)
--   vim.cmd("split")
-- end)


-- auto execute Neotree at nvim start
vim.cmd('autocmd VimEnter * Neotree')
