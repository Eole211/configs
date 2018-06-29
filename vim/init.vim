call plug#begin('~/.local/share/nvim/plugged')

Plug  'ctrlpvim/ctrlp.vim'

Plug 'shougu/unite.vim'

Plug 'vimlab/neojs'

Plug 'neomake/neomake'

Plug 'eugen0329/vim-esearch'

Plug 'terryma/vim-multiple-cursors'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

Plug 'yegappan/mru',

Plug 'posva/vim-vue'

call plug#end()

autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

" Auto start NERD tree if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif

" no Help at the top of NERD tree"
let NERDTreeMinimalUI=1

" Let quit work as expected if after entering :q the only window left open is NERD Tree itself
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let mapleader = ","                                                                                               
let g:mapleader = ","                                                                                     
let g:ctrlp_custom_ignore = { 'dir': 'build$\|node_modules$' }

" Remove preview window"
set completeopt-=preview

" Show line numbers "
set number

" Spaces & Tabs {{{
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line
" }}} Spaces & Tabs


"F2 Shortcut for Most Recently Used Files
map <F2> :MRU<CR>

"Control O to toggle nerd tree in the buffer's folder
map <C-o> :NERDTreeToggle %<CR>

"js beautify on ,bb "
nnoremap <leader>bb :%!js-beautify -j -q -B -f -<CR>
