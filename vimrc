" setup Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" plugins
Plugin 'artnez/vim-wipeout'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'elixir-lang/vim-elixir'
Plugin 'godlygeek/tabular'
Plugin 'janko-m/vim-test'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'rking/ag.vim'
Plugin 'skalnik/vim-vroom'
Plugin 'szw/vim-tags'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-characterize'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-liquid'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'

" back to regularly scheduled vimrc
call vundle#end()
filetype plugin indent on

set autoindent
set backspace=indent,eol,start
set incsearch       " Incremental search
set laststatus=2    " Always show status line
set relativenumber
set numberwidth=5
set ruler
set showcmd
set smartcase       " Case insensitive searches become sensitive with capitals"
" set splitbelow      " Split windows at bottom"
" set statusline=[%n]\ %<%.99f\ %h%w%m%r%{SL('CapsLockStatusline')}%y%{SL('fugitive#statusline')}%#ErrorMsg#%{SL('SyntasticStatuslineFlag')}%*%=%-14.(%l,%c%V%)\ %P
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set visualbell
set virtualedit=block
set wildmenu
set wildmode=list:longest,full
set wildignore+=*~,*.aux,tags
set cursorline
set timeoutlen=2000 ttimeoutlen=0

set wrap linebreak nolist showbreak=…  " soft wrap text nicely

" Switch syntax highlighting on
syntax on

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

" map Silver Searcher
nnoremap <leader>g :Ag!<space>

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=80
endif

" gist-vim
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1
let g:gist_update_on_write = 2

" Autocommands
if has("autocmd")
  " Remove unneeded white space at the end of lines.
  autocmd FileType c,coffee,css,cpp,erb,haml,html,java,js,md,pl,php,py,rb,rdoc,ru,scss,txt,xml,yml autocmd BufWritePre <buffer> :%s/\s\+$//e

  " Regenerate ctags
  autocmd FileType c,cpp,erb,js,md,pgp,py,rb,rdoc,ru,scss,yml autocmd BufWritePost <buffer> silent! !ctags -R &

  " Syntax of these languages is fussy over tabs vs spaces
  autocmd FileType make setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
  autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

  " Customizations based on house-style
  autocmd FileType c setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
  autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

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
endif

" Plugin settings
if has("eval")
  let g:netrw_list_hide = '^\.,^tags$'
endif

"
" Section: Commands {{{1
" ----------------------
if has("eval")
  " copied from http://github.com/tpope/tpope/.vimrc
  " don't actually know what the function does, though. But it's used for
  " fugitive status line
  function! SL(function)
    if exists('*'.a:function)
      return call(a:function,[])
    else
      return ''
    endif
  endfunction
endif

" If typing 'W' in command mode, do 'w' and don't bitch at me
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'w')?('W'):('w'))

nnoremap Q :<C-U>q<CR>
nnoremap ; :

" Make it easier to navigate to different windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>q :cclose<CR>
nnoremap <leader>f :CtrlP<CR>

" Uppercase word using <c-u>
inoremap <c-u> <esc>viwUea
nnoremap <c-u> viwUe

" Easily write files
nnoremap <leader>w :w<cr>

" Easily edit and source .vimrc and .tmux.conf
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>et :tabedit ~/.tmux.conf<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" bundler mappings
nnoremap <leader>bb :Bundle<CR>
nnoremap <leader>bu :Bundle update
nnoremap <leader>bo :Bundle outdated<CR>

" vim-test
nnoremap <leader>t :TestFile<CR>
nnoremap <leader>s :TestNearest<CR>
nnoremap <leader>l :TestLast<CR>
nnoremap <leader>a :TestSuite<CR>
let g:test#strategy = "dispatch"
let g:test#ruby#rspec#executable = "foreman run rspec"
let g:test#ruby#cucumber#executable = "foreman run cucumber"
