" Use comma as map leader
let mapleader =","
set rtp +=~/.config/nvim
" Colorschemeeee
silent !zsh $HOME/.config/nvim/plugged/gruvbox/gruvbox_256palette_osx.sh

" Autodownload Vim Plug if not installed and run Plug Install
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif
" let g:coc_node_path='/usr/local/opt/node@14/bin/node'

call plug#begin('$HOME/.config/nvim/plugged')

" Colorscheme
Plug 'morhetz/gruvbox'

" Color picker
Plug  'KabbAmine/vCoolor.vim'

" Fuzzy finding
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'


" Change surroundings ""{}()
Plug 'tpope/vim-surround'


""""""""""""""""""""""""
" Lua Native Features  "
""""""""""""""""""""""""
" Language server
Plug 'neovim/nvim-lspconfig'
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
" Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install && yarn run build'}
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
" Autopairing
Plug 'windwp/nvim-autopairs'
Plug 'mfussenegger/nvim-jdtls'
""""""""""""""""""""""""""
""""""""""""""""""""""""""

Plug 'hashivim/vim-terraform'
" Javascript Dev
Plug 'evanleck/vim-svelte'
Plug 'pangloss/vim-javascript'

" Git
Plug 'jreybert/vimagit'

" Comments
Plug 'tpope/vim-commentary'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO: Review usefulness and delete!
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'scrooloose/nerdtree'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO: Learn These!!!! They look super cool
Plug 'vimwiki/vimwiki'
Plug 'bling/vim-airline'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax and file recognition for sxhkd files
Plug 'kovetskiy/sxhkd-vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Latex
Plug 'vim-latex/vim-latex'
Plug 'lervag/vimtex'
Plug 'vifm/vifm.vim'
" Plug 'codechips/coc-svelte', {'do': 'npm install'}
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'pantharshit00/vim-prisma'


call plug#end()

" set up LSP
source $HOME/.config/nvim/setup.lua
set completeopt=menu,menuone,noselect


" Prettier Settings
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat_require_pragma = 0
let g:prettier#exec_cmd_path = '/usr/local/bin/prettier'
" au BufWritePre *.css,*.svelte,*.pcss,*.html,*.ts,*.js,*.json PrettierAsync

" COC
" nnoremap <silent> K :call <SID>show_documentation()<CR>
" function! s:show_documentation()
  " if (index(['vim','help'], &filetype) >= 0)
    " execute 'h '.expand('<cword>')
  " elseif (coc#rpc#ready())
    " call CocActionAsync('doHover')
  " else
  "   execute '!' . &keywordprg . " " . expand('<cword>')
  " endif
" endfunction
" " some remaps
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
" autocmd CursorHold * silent call CocActionAsync('highlight')
" " Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" nmap <silent> <leader>r <Plug>(coc-rename)
" " Mappings for CoCList
" " Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" nnoremap <silent><nowait> <space>f  <Plug>(coc-fix-current)
" " Do default action for next item.
" " nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" " nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>



" Enable true color
" set t_8f=^[[38;2;%lu;%lu;%lum        " set foreground color
" set t_8b=^[[48;2;%lu;%lu;%lum        " set background color
" set t_Co=256                         " Enable 256 colors
set termguicolors                    " Enable GUI colors for the terminal to get truecolor

" Dark if past 7pm, light if not
autocmd vimenter * ++nested colorscheme gruvbox
let hr = (strftime('%H'))
if hr >= 17
set background=dark
elseif hr >= 8
set background=light
elseif hr >= 0
set background=dark
endif

" COC
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" inoremap <silent><expr> <c-space> coc#refresh()



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

" Shortcutting split navigation, saving a keypress:
	" noremap <C-h> <C-w><left>
	" noremap <C-j> <C-w><down>
	" noremap <C-k> <C-w><up>
	" noremap <C-l> <C-w><right>
	" map <C-w>h <C-w>H
	" map <C-w>j <C-w>J
	" map <C-w>k <C-w>K
	" map <C-w>l <C-w>L

" FZF
	map <leader>b :Buffers<Enter>
	map <leader>f :Files<Enter>
	map <leader>g :Rg<Enter>
" Color picker
" let g:vcoolor_lowercase = 1
" let g:vcoolor_disable_mappings = 1
" let g:vcoolor_map = '<A-c>'
" nmap <leader>c	:VCoolor<CR>

" " SVELTE
" if !exists('g:context_filetype#same_filetypes')
"   let g:context_filetype#filetypes = {}
" endif

" let g:context_filetype#filetypes.svelte =
" \ [
" \   {'filetype' : 'javascript', 'start' : '<script>', 'end' : '</script>'},
" \   {
" \     'filetype': 'typescript',
" \     'start': '<script\%( [^>]*\)\? \%(ts\|lang="\%(ts\|typescript\)"\)\%( [^>]*\)\?>',
" \     'end': '',
" \   },
" \   {'filetype' : 'css', 'start' : '<style \?.*>', 'end' : '</style>'},
" \ ]

" let g:ft = ''

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
	set sw=4
	set number relativenumber
" Enable autocompletion:
	set wildmode=longest,list,full

" Vimwiki
  let g:vimwiki_folding = 'list'



" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing prose:
	" map <leader>f :Goyo \| set bg=light \| set linebreak<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
	" map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Check file in shellcheck:
	map <leader>s :!clear && shellcheck %<CR>

" Open my bibliography file in split
	" map <leader>b :vsp<space>$BIB<CR>
	" map <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Open corresponding .pdf/.html or preview

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

let g:vimwiki_list = [{ 'path':'~/Notebook/', 'path_html': '~/Notebook/.html/' }]
autocmd BufRead,BufNewFile $HOME/Notebook/* setlocal autochdir
autocmd BufRead,BufNewFile $HOME/Notebook/Spring2021/HistoireDuCorps/* setlocal dir=$HOME spelllang+=fr
autocmd BufWritePre $HOME/Notebook/*.wiki silent VimwikiTOC
autocmd BufWritePost $HOME/Notebook/*.wiki silent Vimwiki2HTML
autocmd FileType vimwiki setlocal et ci pi sts=0 sw=4 ts=4 mouse=n spell tw=80

"latex
autocmd BufWritePost *.tex silent call Tex_CompileLatex()
let g:Tex_PromptedEnvironments = 'equation,definition,proof,lemma,enumerate,itemize,figure,table'
autocmd FileType tex setlocal tw=80
