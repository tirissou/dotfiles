let mapleader =","

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
" Colorscheme
Plug 'morhetz/gruvbox'
" Color picker
Plug  'KabbAmine/vCoolor.vim'
" Autocompletion engine
" Linter + fixer
" Plug 'dense-analysis/ale'
" Python autocompletion
Plug 'davidhalter/jedi-vim'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Javascript
" Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
" Plug 'carlitux/deoplete-ternjs'

" Change surroundings ""{}()
Plug 'tpope/vim-surround'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO: Review usefulness and delete!
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'scrooloose/nerdtree'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO: Learn These!!!! They look super cool
Plug 'jreybert/vimagit'
Plug 'vimwiki/vimwiki'
Plug 'bling/vim-airline'
" get used to this!
Plug 'tpope/vim-commentary'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax and file recognition for sxhkd files
Plug 'kovetskiy/sxhkd-vim'
Plug 'vifm/vifm.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" Enable true color
set t_8f=^[[38;2;%lu;%lu;%lum        " set foreground color
set t_8b=^[[48;2;%lu;%lu;%lum        " set background color
set t_Co=256                         " Enable 256 colors
set termguicolors                    " Enable GUI colors for the terminal to get truecolor

" Dark if past 7pm, light if not
colorscheme gruvbox
let hr = (strftime('%H'))
if hr >= 19
set background=dark
elseif hr >= 8
set background=light
elseif hr >= 0
set background=dark
endif

" COC
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
" Deoplete
" let g:deoplete#enable_at_startup = 1
" call g:deoplete#custom#option({
" 			\ 'smart_case': v:true,
" 			\ 'ignore_case': v:true,
" 			\ 'camel_case': v:true,
" 			\ })
" call deoplete#custom#option('omni_patterns', {
" \ 'go': '[^. *\t]\.\w*',
" \})
" let g:deoplete#max_abbr_width = 0
" let g:deoplete#max_menu_width = 0
" 'enable_refresh_always': v:true

" Jedi Vim
" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0
let g:jedi#goto_command = "<C-g>"
" open the go-to function in split, not another buffer
" let g:jedi#use_splits_not_buffers = "right"

set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus

" ALE config
" let g:ale_fixers = {}
" let g:ale_fixers['python'] = ['autopep8']
" let g:ale_linters = { 'python': ['flake8'] }
" " Do NOT fix files automatically on save
" let g:ale_fix_on_save = 0
" let g:ale_set_highlights = 0

" Use tern_for_vim.
let g:python3_host_prog = '/opt/miniconda3/bin/python3'
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = [" — persistent"]

" Shortcutting split navigation, saving a keypress:
	noremap <C-h> <C-w><left>
	noremap <C-j> <C-w><down>
	noremap <C-k> <C-w><up>
	noremap <C-l> <C-w><right>
	map <C-w>h <C-w>H
	map <C-w>j <C-w>J
	map <C-w>k <C-w>K
	map <C-w>l <C-w>L

" FZF
	map <A-b> :Buffers<Enter>
	map <A-f> :Files<Enter>
	map <A-g> :Rg<Enter>
" Color picker
let g:vcoolor_lowercase = 1
let g:vcoolor_disable_mappings = 1
let g:vcoolor_map = '<A-c>'
nmap <leader>c	:VCoolor<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'

"" Whether to include the types of the completions in the result data. Default: 0
"let g:deoplete#sources#ternjs#types = 1
"" Whether to include the distance (in scopes for variables, in prototypes for
"" properties) between the completions and the origin position in the result
"" data. Default: 0
"let g:deoplete#sources#ternjs#depths = 1
"" Whether to include documentation strings (if found) in the result data.
"" Default: 0
"let g:deoplete#sources#ternjs#docs = 1
"" When on, only completions that match the current word at the given point will
"" be returned. Turn this off to get all results, so that you can filter on the
"" client side. Default: 1
"let g:deoplete#sources#ternjs#filter = 0
"" Whether to use a case-insensitive compare between the current word and
"" potential completions. Default 0
"let g:deoplete#sources#ternjs#case_insensitive = 0
"" When completing a property and no completions are found, Tern will use some
"" heuristics to try and return some properties anyway. Set this to 0 to
"" turn that off. Default: 1
"let g:deoplete#sources#ternjs#guess = 1
"" Determines whether the result set will be sorted. Default: 1
"" When disabled, only the text before the given position is considered part of
"" the word. When enabled (the default), the whole variable name that the cursor
"" is on will be included. Default: 1
"let g:deoplete#sources#ternjs#expand_word_forward = 0
"" Whether to ignore the properties of Object.prototype unless they have been
"" spelled out by at least two characters. Default: 1
"let g:deoplete#sources#ternjs#omit_object_prototype = 0
"" Whether to include JavaScript keywords when completing something that is not
"" a property. Default: 0
"let g:deoplete#sources#ternjs#include_keywords = 1
"" If completions should be returned when inside a literal. Default: 1
"let g:deoplete#sources#ternjs#in_literal = 0
""Add extra filetypes
"let g:deoplete#sources#ternjs#filetypes = [
"		\ 'js',
"                \ 'jsx',
"                \ 'javascript.jsx',
"                \ 'vue',
"                \ ]

" Javascript

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
" Enable autocompletion:
	set wildmode=longest,list,full

" Vimwiki
  let g:vimwiki_folding = 'list'



" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing prose:
	map <leader>f :Goyo \| set bg=light \| set linebreak<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Check file in shellcheck:
	map <leader>s :!clear && shellcheck %<CR>

" Open my bibliography file in split
	map <leader>b :vsp<space>$BIB<CR>
	map <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and vifm configs with new material:
	autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts

" Update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Navigating with guides
	inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
	vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
	map <leader><leader> <Esc>/<++><Enter>"_c4l

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

let g:vimwiki_list = [{ 'path':'~/.vimwiki/', 'path_html': '~/.vimwiki-html/' }]
autocmd FileType vimwiki setlocal et ci pi sts=0 sw=4 ts=4
