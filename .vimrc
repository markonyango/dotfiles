call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

nnoremap <silent> <C-p> :GFiles <Cr>
nnoremap <silent> <C-o> :Buffers<Cr>
nnoremap <silent> <C-f> :Rg <Cr>

