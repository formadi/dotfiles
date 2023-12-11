-- background transparency
vim.cmd([[ hi Normal            guibg=NONE ctermbg=NONE ]])
vim.cmd([[ hi SignColumn        guibg=NONE ctermbg=NONE ]])
vim.cmd([[ hi VertSplit         guibg=NONE ctermbg=NONE ]])
vim.cmd([[ hi StatusLine        guibg=NONE ctermbg=NONE ]])
vim.cmd([[ hi StatusLineNC      guibg=NONE ctermbg=NONE ]])
vim.cmd([[ hi Folded            guibg=NONE ctermbg=NONE ]])
vim.cmd([[ hi NeoTreeNormal     guibg=NONE ctermbg=NONE ]])
vim.cmd([[ hi NormalNC          guibg=NONE ctermbg=NONE ]])
vim.cmd([[ hi NeoTreeNormalNC   guibg=NONE ctermbg=NONE ]])

-- custom colors
vim.cmd([[ hi Winseparator  guibg=NONE guifg=#5f7a9b ]])
vim.cmd([[ hi CursorLine               guibg=#393a52 ]])
vim.cmd([[ hi LineNr                   guifg=#676a88 ]])
vim.cmd([[ hi CursorLineNr             guifg=#cee6fe ]])
vim.cmd([[ hi Comment                  guifg=#797e99 ]])


-- automatically remove trailing whitespaces & trailing newlines on save.
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[ silent! %s/\s\+$//e | silent! %s#\($\n\s*\)\+\%$## ]],
})


-- insert mode : no cusorline, the other mode : cursorline
vim.cmd [[
  :autocmd InsertEnter * set nocul
  :autocmd InsertLeave * set cul
]]


-- fold setting
vim.o.foldlevel      = 99
vim.o.foldcolumn     = '2'
vim.wo.foldnestmax   = 10
vim.wo.foldminlines  = 2
vim.o.foldenable     = true
vim.o.foldlevelstart = 99
vim.o.foldtext       = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').' ... ' . '󱝁  ' . (v:foldend - v:foldstart + 1) . ' lines']]
vim.wo.foldmethod    = "indent"
vim.wo.foldexpr      = "nvim_treesitter#foldexpr()"
vim.o.fillchars      = [[eob: ,fold: ,foldopen:▽,foldsep:┊,foldclose:▷]]
vim.cmd('highlight Folded     ctermbg=NONE guibg=NONE')
vim.cmd('highlight FoldColumn ctermfg=NONE guifg=NONE')
