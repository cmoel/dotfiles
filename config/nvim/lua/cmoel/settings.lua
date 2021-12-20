vim.g["netrw_banner"] = 0

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 6
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.showcmd = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.errorbells = false
vim.opt.wildmenu = true
vim.opt.wildmode = {"list", "longest"}
vim.opt.cursorline = true
vim.opt.colorcolumn = "100"
vim.opt.winwidth = 100
vim.opt.hlsearch = false
vim.opt.lazyredraw = true
vim.opt.wrap = false

vim.cmd [[
  cabbrev Wq wq
  cabbrev W w
  cabbrev Bd bd
  cabbrev Tabe tabedit
  cabbrev Tabm tabmove
  cabbrev TAbe tabedit
  cabbrev TAbm tabmove
]]
