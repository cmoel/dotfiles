set nocompatible
call plug#begin('~/.vim/plugged')

" plugins
Plug 'christoomey/vim-tmux-navigator'
Plug 'bronson/vim-trailing-whitespace'
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'elmcast/elm-vim', { 'for': 'elm' }
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'janko-m/vim-test'
Plug 'kana/vim-textobj-user'
Plug 'kien/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'mattn/gist-vim', { 'on': 'Gist' }
Plug 'mattn/webapi-vim', { 'on': 'Gist' }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'js', 'jsx'] }
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'szw/vim-tags'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-git'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

" back to regularly scheduled vimrc
call plug#end()

set exrc
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
highlight CursorLine   ctermbg=236 cterm=none
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

" jsx
let g:jsx_ext_required = 0

" elm
let g:elm_format_autosave = 1
let g:elm_setup_keybindings = 0
let g:elm_make_show_warnings = 1
nnoremap <leader>ef :ElmFormat<CR>
nnoremap <leader>em :ElmMake %<CR>

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

  " Use 4 spaces for Elm files
  autocmd BufRead,BufNewFile *.elm setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

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
cabbrev Tabe tabedit
cabbrev Tabm tabmove

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
let test#javascript#mocha#options = "--compilers js:babel-core/register"

set secure
