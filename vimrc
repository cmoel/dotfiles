" setup Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" plugins
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'elixir-lang/vim-elixir'
Plugin 'godlygeek/tabular'
Plugin 'janko-m/vim-test'
Plugin 'kana/vim-textobj-user'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'mxw/vim-jsx'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'othree/yajs.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'rking/ag.vim'
Plugin 'szw/vim-tags'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-characterize'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-liquid'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'

" back to regularly scheduled vimrc
call vundle#end()
filetype indent plugin on

set ignorecase
set smartcase
set number
set relativenumber
set numberwidth=5
set nobackup
set noswapfile
set splitbelow
set splitright
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]
set showcmd
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set visualbell
set virtualedit=block
set wildmode=list:longest,full
set wildignore+=*~,*.aux,tags
set cursorline
set lazyredraw
set nowrap

" leader
let mapleader = "\<Space>"
let maplocalleader = "\\"

" set up some custom colors
highlight clear SignColumn
highlight VertSplit    ctermbg=236
highlight ColorColumn  ctermbg=237
highlight LineNr       ctermbg=236 ctermfg=240
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236 cterm=bold
highlight StatusLineNC ctermbg=12  ctermfg=0
highlight StatusLine   ctermbg=235 ctermfg=12
highlight IncSearch    ctermbg=0   ctermfg=3
highlight Search       ctermbg=0   ctermfg=9
highlight Visual       ctermbg=3   ctermfg=0
highlight Pmenu        ctermbg=235 ctermfg=12
highlight PmenuSel     ctermbg=0   ctermfg=3
highlight SpellBad     ctermbg=0   ctermfg=1

" highlight the status bar when in insert mode
if version >= 700
  " green in insert mode
  au InsertEnter * hi StatusLine ctermbg=235 ctermfg=2
  " blue in normal/visual mode
  au InsertLeave * hi StatusLine ctermbg=235 ctermfg=12
endif

" save keystrokes
nnoremap 0 ^
nnoremap ! :!
nnoremap <leader>r :redraw!<CR>
nnoremap j gj
nnoremap k gk

" map Silver Searcher
nnoremap <leader>g :Ag!<space>

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=84
endif

" window splits
set winwidth=100

" gist-vim
let g:gist_open_browser_after_post = 0
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1
let g:gist_update_on_write = 1

" Autocommands
if has("autocmd")
  " Remove unneeded white space at the end of lines.
  autocmd FileType c,coffee,css,cpp,erb,haml,html,java,js,md,pl,php,py,rb,rdoc,ru,scss,txt,xml,yml autocmd BufWritePre <buffer> :%s/\s\+$//e

  " Treat <li> and <p> tags like the block tags they are
  let g:html_indent_tags = 'li\|p'

  " Markdown files end in .md
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd BufRead,BufNewFile *.md setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80"

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  autocmd BufReadPost fugitive://* set bufhidden=delete

  autocmd BufReadPost quickfix nnoremap <buffer> q :q<CR>
endif

" Plugin settings
if has("eval")
  let g:netrw_list_hide = '^\.,^tags$'
endif

" If typing 'W' in command mode, do 'w' and don't bitch at me
cabbrev Wq :wq
cabbrev W :w
cabbrev Bd bd

nnoremap Q :<C-U>qall<CR>
nnoremap <leader>q :cclose<CR>
nnoremap <leader>f :CtrlP<CR>

" Easily write files
nnoremap <leader>w :w<cr>

" Easily edit and source .vimrc and .tmux.conf
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>et :tabedit ~/.tmux.conf<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>


" vim-test
nnoremap <leader>T :TestFile<CR>
nnoremap <leader>t :TestNearest<CR>
nnoremap <leader>l :TestLast<CR>
nnoremap <leader>a :TestSuite<CR>
let g:test#strategy = "dispatch"
let g:test#ruby#rspec#executable = "foreman run bundle exec rspec"
let g:test#ruby#cucumber#executable = "foreman run bundle exec cucumber"
let g:test#ruby#minitest#executable = "foreman run rake"
