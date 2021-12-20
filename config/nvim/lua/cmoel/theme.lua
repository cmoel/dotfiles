-- set up some custom colors
vim.cmd [[
  highlight clear SignColumn
  highlight VertSplit    ctermbg=235
  highlight ColorColumn  ctermbg=233
  highlight LineNr       ctermbg=234 ctermfg=240
  highlight CursorLineNr ctermbg=234 ctermfg=240
  highlight CursorLine   ctermbg=235 cterm=none
  highlight StatusLineNC ctermbg=12  ctermfg=0
  highlight StatusLine   ctermbg=234 ctermfg=12
  highlight IncSearch    ctermbg=0   ctermfg=3
  highlight Search       ctermbg=0   ctermfg=9
  highlight Visual       ctermbg=3   ctermfg=0
  highlight Pmenu        ctermbg=234 ctermfg=12
  highlight PmenuSel     ctermbg=0   ctermfg=3
  highlight SpellBad     ctermbg=0   ctermfg=1
]]

-- set up some custom colors
vim.cmd [[
  autocmd InsertEnter * hi StatusLine ctermbg=235 ctermfg=2
  autocmd InsertLeave * hi StatusLine ctermbg=235 ctermfg=12
]]
