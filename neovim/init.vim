set background=dark
set number

set scrolloff=5

set list
set listchars=tab:»·,trail:·,precedes:<,extends:>
set listchars+=eol:¬
highlight NonText term=none cterm=none ctermfg=235  " eol, extends, precedes
highlight SpecialKey term=bold cterm=bold ctermfg=red ctermbg=none " space, tab, trail

"
" Plugins
"

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/0.10.0/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'cespare/vim-toml'
Plug 'fatih/vim-go'

call plug#end()
