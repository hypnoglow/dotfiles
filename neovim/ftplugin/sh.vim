setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab

set list
set listchars=tab:»·,trail:·,precedes:<,extends:>
set listchars+=eol:¬
highlight NonText term=none cterm=none ctermfg=235  " eol, extends, precedes
highlight SpecialKey term=bold cterm=bold ctermfg=red ctermbg=none " space, tab, trail
