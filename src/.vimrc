""" Primary """

set nocompatible
set number
syntax on
set fileencoding=utf-8

""" Whitespace & identation """

set tabstop=4
" For >> and <<
set shiftwidth=4

" Insert 'shiftwidth' length on <TAB> in front of line (does not depend on tabstop & softtabstop).
" <BS> also deletes an indent.
set smarttab
" Tabs to spaces
set expandtab

set autoindent
set smartindent

""" Line length & wrapping """

" Wrap width
set textwidth=80
" Disable automatic wrapping
set formatoptions-=t
" Show width separator
let &colorcolumn=&textwidth
" Separator color
highlight ColorColumn ctermbg=darkgray


"""""""""" SEARCH """"""""""
" При поиске перескакивать на найденный текст в процессе набора строки
set incsearch
" Включаем подсветку выражения, которое ищется в тексте
set hlsearch
" Останавливать поиск при достижении конца файла
set nowrapscan
" Игнорировать регистр букв при поиске
set ignorecase
" умная зависимость от регистра. Детали `:h smartcase`
set smartcase
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"! Поддержка мыши
"set mouse=a
"set mousemodel=popup

"set nowrap
"set listchars+=precedes:<,extends:>

" Кодировка текста по умолчанию utf8
"set termencoding=utf8
" Показывать положение курсора всё время.
"set ruler
" Показывать незавершённые команды в статусбаре
"set showcmd
" Фолдинг по отсупам
" set foldenable
"set foldlevel=100
"set foldmethod=indent
" Выключаем звуковое оповещение о достижении конца буффера, невозможности действия и т.д.
" set noerrorbells visualbell t_vb=
"autocmd GUIEnter * set visualbell t_vb=



"! Всегда отображать строку статуса
"set laststatus=2


" Включаем отображение выполняемой в данный момент команды в правом нижнем углу экрана.
" К примеру, если вы наберете 2d, то в правом нижнем углу экрана Vim отобразит строку 2d.
"set showcmd
" Включаем отображение дополнительной информации в статусной строке
"set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P

" Отображение парных символов
"set showmatch
" Навигация с учетом русских символов, учитывается командами следующее/предыдущее слово и т.п.
"set iskeyword=@,48-57,_,192-255
" Удаление символов бэкспэйсом в Windows
"set backspace=indent,eol,start


""" CURRENT LINE HIGHLIGHTING """
" Highlight current line
"set cursorline
" Color for current line hightlighting
"highlight CursorLine ctermbg=darkgray
" Set text to bold on current line
"highlight CursorLine cterm=bold

" Увеличение размера истории
"set history=200

" Дополнительная информация в строке состояния
"set wildmenu
" Включаем bash-подобное дополнение командной строки (по TAB)
"set wildmode=longest:list,full


" Настройка отображения специальных символов
"set list listchars=tab:→\ ,trail:·
" Включение сторонних плагинов
"filetype plugin on

" Опции автодополнения - включаем только меню с доступными вариантами
" автодополнения (также, например, для omni completion может быть
" окно предварительного просмотра).
"set completeopt=menu

" Не выгружать буфер, когда переключаемся на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без необходимости сохранения каждый раз
" когда переключаешься между ними
"set hidden

" Сделать строку команд высотой в одну строку
"set ch=1
" Скрывать указатель мыши, когда печатаем
"set mousehide

"! Включаем перенос строк
"set wrap
"! Перенос строк по словам, а не по буквам
"set linebreak


"call plug#begin('~/.vim/plugged')
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"call plug#end()

" Pathogen setup
"execute pathogen#infect()
"filetype plugin indent on

"function! SuperCleverTab()
"    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
"        return "\<Tab>"
"    else
"        return "\<C-p>"
"    endif
"endfunction
"inoremap <Tab> <C-R>=SuperCleverTab()<cr>

" colors of status line
"hi StatusLine ctermbg=2 ctermfg=0
"au InsertEnter * hi StatusLine term=reverse ctermbg=3 gui=undercurl guisp=Magenta
"au InsertLeave * hi StatusLine term=reverse ctermbg=2 gui=bold,reverse
