-- setup color scheme
if _G.color_scheme == "catppuccin" then
  require(_G.color_scheme).setup({
    flavour = "Mocha",
  })
else
  if _G.color_scheme ~= "iceberg" then
    require(_G.color_scheme).setup()
  end
end

-- set colorscheme
vim.cmd.colorscheme(_G.color_scheme)


-- custom color
if     _G.color_scheme == "catppuccin" then
    vim.cmd([[ hi Winseparator  guibg=NONE guifg=#5f7a9b ]])
    -- vim.cmd([[ hi CursorLine               guibg=#3e4a42 ]])
    vim.cmd([[ hi LineNr                   guifg=#676a88 ]])
    vim.cmd([[ hi CursorLineNr             guifg=#cee6fe ]])
    vim.cmd([[ hi Comment                  guifg=#797e99 ]])
    vim.cmd([[ hi Visual                   guibg=#45475b ]])

elseif _G.color_scheme == "everforest" then
    vim.cmd([[ hi Winseparator  guibg=NONE guifg=#7f989b ]])
    vim.cmd([[ hi CursorLine               guibg=#313825 ]])
    vim.cmd([[ hi LineNr                   guifg=#5b6e62 ]])
    vim.cmd([[ hi CursorLineNr             guifg=#cee6fe ]])
    vim.cmd([[ hi Comment                  guifg=#6d848f ]])
    vim.cmd([[ hi Visual                   guibg=#3d3a33 ]])

elseif _G.color_scheme == "nord" then
    vim.cmd([[ hi Winseparator  guibg=NONE guifg=#5f7a9b ]])
    -- vim.cmd([[ hi CursorLine               guibg=#393a52 ]])
    vim.cmd([[ hi LineNr                   guifg=#676a88 ]])
    vim.cmd([[ hi CursorLineNr             guifg=#cee6fe ]])
    vim.cmd([[ hi @comment                 guifg=#738fa4 ]])
    vim.cmd([[ hi Visual                   guibg=#354646 ]])

else -- iceberg
    vim.cmd([[ hi Winseparator  guibg=NONE guifg=#5f7a9b ]])
    -- vim.cmd([[ hi CursorLine               guibg=#393a52 ]])
    vim.cmd([[ hi LineNr                   guifg=#676a88 ]])
    vim.cmd([[ hi CursorLineNr             guifg=#cee6fe ]])
    vim.cmd([[ hi Comment                  guifg=#657997 ]])
    vim.cmd([[ hi Visual                   guibg=#45475b ]])
end


-- background transparency
vim.cmd([[ hi Normal              guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi SignColumn          guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi VertSplit           guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi StatusLine          guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi StatusLineNC        guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi Folded              guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi NeoTreeNormal       guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi NormalNC            guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi AerialNormal        guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi NeoTreeNormalNC     guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi NeoTreeEndOfBuffer  guibg=NONE    ctermbg=NONE ]])

-- vim.cmd([[ hi Lualine_a.normal   guibg=NONE    ctermbg=NONE ]])
-- vim.cmd([[ hi lualine_b.normal   guibg=NONE    ctermbg=NONE ]])
-- vim.cmd([[ hi lualine_c.normal   guibg=NONE    ctermbg=NONE ]])
-- vim.cmd([[ hi lualine_x.normal   guibg=NONE    ctermbg=NONE ]])
-- vim.cmd([[ hi lualine_y.normal   guibg=NONE    ctermbg=NONE ]])





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
