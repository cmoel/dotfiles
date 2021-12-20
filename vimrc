set nocompatible
call plug#begin('~/.vim/plugged')

" plugins
" Plug 'bronson/vim-trailing-whitespace'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
" Plug 'christoomey/vim-system-copy'
" Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
" Plug 'elmcast/elm-vim', { 'for': 'elm' }
" Plug 'evanleck/vim-svelte'
" Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'janko-m/vim-test'
" Plug 'joereynolds/gq.vim'
" Plug 'jparise/vim-graphql'
" Plug 'kana/vim-textobj-user'
" Plug 'kana/vim-textobj-entire'
" Plug 'kana/vim-textobj-line'
" Plug 'kchmck/vim-coffee-script'
" Plug 'kien/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'mattn/gist-vim', { 'on': 'Gist' }
Plug 'mattn/webapi-vim', { 'on': 'Gist' }
" Plug 'prettier/vim-prettier',
" Plug 'prettier/vim-prettier', { 'tag': '0.2.6' }
" Plug 'prettier/vim-prettier', { 'tag': '1.0.0-alpha' }
Plug 'prettier/vim-prettier', { 'tag': '1.0.0-beta' }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['javascript', 'javascriptreact', 'js', 'jsx', 'typescript', 'typescriptreact', 'ts', 'tsx'] }
" Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascriptreact', 'js', 'jsx'] }
" Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'pantharshit00/vim-prisma'
" Plug 'reasonml-editor/vim-reason-plus'
Plug 'rking/ag.vim', { 'on': 'Ag' }
" Plug 'slim-template/vim-slim'
" Plug 'suy/vim-context-commentstring', { 'for': ['javascript', 'javascriptreact', 'js', 'jsx'] }
" Plug 'szw/vim-tags'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-git'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
" Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

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
set statusline=%F%m%r%h%w\ %{ObsessionStatus()}\ [%l,%c]\ [%L,%p%%]
set showcmd
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set noerrorbells
" set visualbell
set virtualedit=block
set wildmode=list:longest,full
set wildignore+=*~,*.aux,tags
set cursorline
set lazyredraw
set nowrap

" " turn off syntax highlighting
" syntax off

" Disable paranthesis match highlighting since it makes vim really slow
" https://stackoverflow.com/a/47811468/775292
let g:loaded_matchparen=1

" leader
let mapleader = "\<Space>"
let maplocalleader = "\\"

" set up some custom colors
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
nnoremap \ :Ag!<space>

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=120
endif

" window splits
set winwidth=100

" gist-vim
let g:gist_open_browser_after_post = 0
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1
let g:gist_update_on_write = 1
let g:gist_clip_command = 'pbcopy'

" js/jsx
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

" " elm
" " let g:elm_format_autosave = 0
" let g:elm_format_autosave = 1
" let g:elm_setup_keybindings = 0
" let g:elm_make_show_warnings = 1
" nnoremap <leader>ef :ElmFormat<CR>
" nnoremap <leader>em :ElmMake %<CR>

" let g:prettier#autoformat = 0
" let g:prettier#exec_cmd_async = 1
" let g:prettier#config#print_width = 100
" let g:prettier#config#semi = 'false'
" let g:prettier#config#jsx_bracket_same_line = 'false'
" let g:prettier#config#trailing_comma = 'es5'
" let g:prettier#config#single_quote = 'false'
" let g:prettier#config#bracket_spacing = 'false'
" let g:prettier#config#arrow_parens = 'always'

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
  autocmd BufRead,BufNewFile *.md setlocal textwidth=100"

  " " Svelte files are basically HTML
  " au! BufNewFile,BufRead *.svelte set ft=html

  " " Use 4 spaces for Elm files
  " autocmd BufRead,BufNewFile *.elm setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  autocmd BufReadPost fugitive://* set bufhidden=delete

  autocmd BufReadPost quickfix nnoremap <buffer> q :q<CR>

  autocmd FileType javascript setlocal formatprg=prettier
  autocmd FileType javascriptreact setlocal formatprg=prettier
endif

" Plugin settings
if has("eval")
  let g:netrw_list_hide = '^\.,^tags$'
endif

" If typing 'W' in command mode, do 'w' and don't bitch at me
cabbrev Wq wq
cabbrev W w
cabbrev Bd bd
cabbrev Tabe tabedit
cabbrev Tabm tabmove
cabbrev TAbe tabedit
cabbrev TAbm tabmove

nnoremap Q :<C-U>qall<CR>
nnoremap <leader>q :cclose<CR>

" Easily write files
nnoremap <leader>w :w<cr>

" Easily edit and source .vimrc and .tmux.conf
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>et :tabedit ~/.tmux.conf<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" VTR
let g:VtrOrientation = "h"
let g:VtrPercentage = 35
let g:vtr_filetype_runner_overrides = { 'javascript.jsx': 'node {file}' }

nnoremap <leader>ra :VtrAttachToPane<cr>
nnoremap <leader>rf :VtrFocusRunner<cr>
nnoremap <leader>rr :VtrSendLinesToRunner<cr>
nnoremap <leader>rd :VtrSendCtrlD<cr>
nnoremap <leader>sf :VtrSendFile<cr>

" vim-test
let g:test#strategy = "vtr"
let test#javascript#jest#options = "--ci"
" let test#javascript#jest#options = "--ci --detectOpenHandles --runInBand"
let test#ruby#minitest#options = { "all": "--verbose" }

" function! DevNullErrors(cmd) abort
"   echo shellescape(a:cmd)
"   " return shellescape(a:cmd . ' 2> /dev/null')
"   return a:cmd
" endfunction

" let g:test#custom_transformations = {'dev_null_errors': function('DevNullErrors')}
" let g:test#transformation = 'dev_null_errors'

nnoremap <leader>T :TestFile<CR>
nnoremap <leader>t :TestNearest<CR>
nnoremap <leader>l :TestLast<CR>
nnoremap <leader>a :TestSuite<CR>

" " szw/vim-tags
" let g:vim_tags_auto_generate = 0
nnoremap <leader>c :VtrSendCommandToRunner git ctags<CR>

set secure
