-- setup color scheme
if _G.color_scheme.setup == true then
  if _G.color_scheme.name == "catppuccin" then
      require(_G.color_scheme.name).setup({
        flavour = "Mocha",
      })
  else
    require(_G.color_scheme.name).setup()
  end

  if _G.color_scheme.name == "vscode" then
    require('vscode').load()
  end
end

-- set colorscheme
vim.cmd.colorscheme(_G.color_scheme.name)

-- set lualine theme
if _G.color_scheme.lualine == true then
  require("lualine").setup ({
    options = {
      theme = _G.color_scheme.name,
    },
  })
end


-- custom color
if     _G.color_scheme.name == "catppuccin" then
  vim.cmd([[ hi Winseparator  guibg=NONE guifg=#5f7a9b ]])
  -- vim.cmd([[ hi CursorLine               guibg=#3e4a42 ]])
  vim.cmd([[ hi LineNr                   guifg=#676a88 ]])
  vim.cmd([[ hi CursorLineNr             guifg=#cee6fe ]])
  vim.cmd([[ hi Comment                  guifg=#797e99   cterm=italic  gui=italic ]])
  vim.cmd([[ hi Visual                   guibg=#45475b ]])
  vim.cmd([[ hi @ibl.indent.char.1       guifg=#415162 ]])      -- default indent line color

elseif _G.color_scheme.name == "everforest" then
  vim.cmd([[ hi Winseparator  guibg=NONE guifg=#7f989b ]])
  vim.cmd([[ hi CursorLine               guibg=#313825 ]])
  vim.cmd([[ hi LineNr                   guifg=#5b6e62 ]])
  vim.cmd([[ hi CursorLineNr             guifg=#cee6fe ]])
  vim.cmd([[ hi Comment                  guifg=#6d848f   cterm=italic  gui=italic ]])
  vim.cmd([[ hi Visual                   guibg=#3d3a33 ]])

elseif _G.color_scheme.name == "nord" then
  vim.cmd([[ hi Winseparator  guibg=NONE guifg=#5f7a9b ]])
  -- vim.cmd([[ hi CursorLine               guibg=#393a52 ]])
  vim.cmd([[ hi LineNr                   guifg=#676a88 ]])
  vim.cmd([[ hi CursorLineNr             guifg=#cee6fe ]])
  vim.cmd([[ hi @comment                 guifg=#738fa4   cterm=italic  gui=italic ]])
  vim.cmd([[ hi Visual                   guibg=#354646 ]])

elseif _G.color_scheme.name == "iceberg" then
  vim.cmd([[ hi Winseparator  guibg=NONE guifg=#5f7a9b ]])
  vim.cmd([[ hi CursorLine               guibg=#393a52 ]])
  vim.cmd([[ hi LineNr                   guifg=#676a88 ]])
  vim.cmd([[ hi CursorLineNr             guifg=#cee6fe ]])
  vim.cmd([[ hi Comment                  guifg=#657997   cterm=italic  gui=italic ]])
  vim.cmd([[ hi Visual                   guibg=#45475b ]])

elseif _G.color_scheme.name == "vscode" then
  vim.cmd([[ hi Winseparator  guibg=NONE guifg=#5f7a9b ]])
  vim.cmd([[ hi CursorLine               guibg=#3f3f3f ]])
  vim.cmd([[ hi LineNr                   guifg=#676a88 ]])
  vim.cmd([[ hi CursorLineNr             guifg=#cee6fe ]])
  vim.cmd([[ hi Comment                  guifg=#657997   cterm=italic  gui=italic ]])
  vim.cmd([[ hi Visual                   guibg=#45475b ]])

elseif _G.color_scheme.name == "poimandres" then
  vim.cmd([[ hi Winseparator  guibg=NONE guifg=#5f7a9b ]])
  -- vim.cmd([[ hi CursorLine               guibg=#3f3f3f ]])
  vim.cmd([[ hi LineNr                   guifg=#676a88 ]])
  vim.cmd([[ hi CursorLineNr             guifg=#cee6fe ]])
  vim.cmd([[ hi Comment                  guifg=#6688bc   cterm=italic  gui=italic ]])
  -- vim.cmd([[ hi Visual                   guibg=#45475b ]])
  vim.cmd([[ hi NonText                  guifg=#828990   cterm=italic  gui=italic ]])      -- virtual text
end


-- background transparency
vim.cmd([[ hi Normal                 guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi SignColumn             guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi LineNr                 guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi VertSplit              guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi StatusLine             guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi StatusLineNC           guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi CursorColumn           guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi Folded                 guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi FoldColumn             guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi NeoTreeNormal          guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi NormalNC               guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi AerialNormal           guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi NeoTreeNormalNC        guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi NeoTreeEndOfBuffer     guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi GitGutterAdd           guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi GitGutterChange        guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi GitGutterChangeDelete  guibg=NONE    ctermbg=NONE ]])
vim.cmd([[ hi GitGutterDelete        guibg=NONE    ctermbg=NONE ]])


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
