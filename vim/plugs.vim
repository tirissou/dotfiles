call plug#begin('~/.vim/plugged')

" Plug imports 

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'

call plug#end()

" JSX options
let g:jsx_ext_required = 1

