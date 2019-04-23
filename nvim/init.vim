call plug#begin('~/.local/share/nvim/plugged')

Plug  'ctrlpvim/ctrlp.vim'

Plug 'matze/vim-move'

Plug 'neomake/neomake'

Plug 'eugen0329/vim-esearch'
"Type <leader>ff and insert a search pattern (usually <leader> is \). Use s, v and t buttons to open file under the cursor in split, vertical split and in tab accordingly. Use Shift along with s, v and t buttons to open a file silently. Press Shift-r to reload currrent results.
"To switch between case-sensitive/insensitive, whole-word-match and regex/literal pattern in command line use Ctrl-oCtrl-r, Ctrl-oCtrl-s or Ctrl-oCtrl-w (mnemonics is set Option: Regex, case Sesnsitive, Word regex).

Plug 'terryma/vim-multiple-cursors'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

Plug 'yegappan/mru',

Plug 'posva/vim-vue'

Plug 'isRuslan/vim-es6'

Plug 'pangloss/vim-javascript'

Plug 'w0rp/ale'

Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --global prettier',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

Plug 'airblade/vim-gitgutter'

" Show infos about current file... etc => bottom bar 
Plug 'itchyny/lightline.vim'
" Show the current git branch in it
Plug 'itchyny/vim-gitbranch'

call plug#end()

"--------NERDTREE Section--------------
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

" Auto start NERD tree if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif

" no Help at the top of NERD tree"
let NERDTreeMinimalUI=1

"Show hidden files
let NERDTreeShowHidden=1

" Let quit work as expected if after entering :q the only window left open is NERD Tree itself
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Control O to toggle nerd tree in the buffer's folder
map <silent> <C-i> :NERDTreeToggle<CR>
map <silent> <C-o> :NERDTreeFocus<CR>

" Reveal current buffer in nerdtree
nmap ,n :NERDTreeFind<CR>

"-------End NERDTREE Section -------------

"YouCompleteMe Go to declaration or definition shotcut"
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" --- LINTER ------
let g:ale_linters = {'javascript': ['eslint']}
" let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_completion_enabled = 1
" let g:ale_fix_on_save = 1
"nmap <leader>d <Plug>(ale_fix)

" ---- JS part -----
function ESLintFix()
  write
  silent execute "!./node_modules/.bin/eslint --fix %"
  edit! %
  redraw!
endfunction
nmap <silent> <C-B> :call ESLintFix()<CR>

" ignore node modules
let g:ctrlp_custom_ignore = { 'dir': 'build$\|node_modules$' }

"js doc highlighting
let g:javascript_plugin_jsdoc = 1

" ---- END JS Part

" Bottom line : 
" display branch name
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }


"map leader"
let mapleader = ","                                             
let g:mapleader = ","                                                                   

" reload files modified outside of vim 
set autoread

" Remove preview window"
set completeopt-=preview

" Show line numbers "
set number

"CtrL to toogle line numbers
noremap <C-L> :set invnumber<CR>

"Line wrap keeping identation"
set breakindent

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

"Move line or selection vertically with Ctrl J and Ctrl K"
let g:move_key_modifier = 'C'

