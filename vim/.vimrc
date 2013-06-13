set nocompatible
set background=dark
set number
set ruler
set foldmethod=indent
set foldlevel=99
set laststatus=2
set showcmd

colorscheme railscasts

" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Maps "
"
inoremap jk <Esc>
"
" map tab switching to something easier
map <C-h> gT
map <C-l> gt
"
" toggle fold
function ToggleFold()
    if (&foldlevel == 99)
	set foldlevel=0
    else
	set foldlevel=99
    endif
endfunction
map <leader>f :call ToggleFold()<CR>

" python-mode options
" TODO: test
let g:pymode_breakpoint_key = '<leader>q'
let g:pymode_breakpoint_cmd = "import ipdb; ipdb.set_trace() ### XXX BREAKPOINT"
let g:pymode_lint_ignore = 'E261,E127,E128,E501'
let g:pymode_rope_always_show_complete_menu = 1
