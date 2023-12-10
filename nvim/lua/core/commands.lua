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

-- automatically remove trailing whitespace on save.
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[ silent! %s/\s\+$//e | silent! %s#\($\n\s*\)\+\%$## ]],
})

-- centering automatically at scrolling
-- vim.cmd [[
--   augroup VCenterCursor
--     au!
--     au BufEnter,WinEnter,WinNew,VimResized *,*.*
--           \ let &scrolloff=winheight(win_getid())/2
--   augroup END
-- ]]
