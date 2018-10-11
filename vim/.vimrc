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

filetype plugin indent on
syntax on
" avoid syntax highlighting issues:
syntax sync fromstart

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Maps "
"
inoremap jk <Esc>
"
" map tab switching to something easier
map <C-h> gT
map <C-l> gt
map <C-j> :execute "tabmove" tabpagenr() - 2 <CR>
map <C-k> :execute "tabmove" tabpagenr() <CR>
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

let NERDTreeIgnore = ['\.pyc$']

" automatically run flake8 on save
" FIXME: does flake8 work at all?
autocmd BufWritePost *.py call Flake8()

" Qargs
" Populate argument list with all files in the quickfix list
" Ex.
"     :Qargs | argdo %s/findme/replacement/gc | update
command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction
