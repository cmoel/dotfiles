vim.cmd [[
  autocmd FileType c,css,cpp,erb,html,js,md,rb,scss,txt,yml autocmd BufWritePre <buffer> :%s/\s\+$//e
  autocmd BufRead,BufNewFile *.md setlocal textwidth=100
]]
