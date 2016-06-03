"
" Primary
"

set nocompatible
syntax on

filetype plugin on
filetype indent on

set number
"set relativenumber

set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf8

set ttyfast

"
" Whitespace, identation, wrapping, formating
"

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

set autoindent
set smartindent

" Text displays fairly.
" Automatic formatting is enabled,
" if 'textwidth' is specified for current syntax
set nowrap " Display text naturally
"set textwidth=80
set formatoptions=troqnl1

"
" Search
"

set incsearch
set hlsearch
set nowrapscan
set smartcase

"
" Status line
"

set laststatus=2
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P
set ruler
set showcmd
set showmode

" Completion
set wildmenu

"
" UI
"

set background=dark
hi underlined cterm=underline
hi LineNr ctermfg=238 ctermbg=none
hi Cursor ctermbg=15 ctermfg=0
hi CursorLineNr ctermfg=gray ctermbg=none

set cursorline
highlight CursorLine cterm=bold

let &colorcolumn=80
highlight ColorColumn ctermbg=233

" Show whitespaces
set list
set listchars=tab:»·,trail:·,precedes:<,extends:>
set listchars+=eol:¬
highlight NonText term=none cterm=none ctermfg=235  " eol, extends, precedes
highlight SpecialKey term=bold cterm=bold ctermfg=red ctermbg=none " space, tab, trail

"
" History
"

set history=1000

"
" Evil
"

set mouse=a

"
" Navigating, scrolling
"
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

"
" Insert mode
"

set backspace=indent,eol,start
