call plug#begin('~/.local/share/nvim/plugged')

" find file with ctrl P
Plug  'ctrlpvim/ctrlp.vim'

" move selection vertically => ctrl J - ctrl L
Plug 'matze/vim-move'

" async things
Plug 'neomake/neomake'

" leader - f f to search in the whole project 
Plug 'eugen0329/vim-esearch'

" ctrl N to multiple cursor (then visual mode => C to replace words) 
Plug 'terryma/vim-multiple-cursors'

" nerdTree classic (tab to toogle, leader-N : reveal current buffer in it)
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Auto complete, with ternjs
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

" last used files (f2)
Plug 'yegappan/mru',

" vue highlights
Plug 'posva/vim-vue'

" es6 higlight
Plug 'isRuslan/vim-es6'

" advanced js
Plug 'pangloss/vim-javascript'

" linter eslint (customo eslint fix with ctrl B) 
Plug 'w0rp/ale'

" prettier : leader-P
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --global prettier',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

" Show git info in the gutter (Leader-T to toogle)
Plug 'airblade/vim-gitgutter'

" Show infos about current file... etc => bottom bar 
Plug 'itchyny/lightline.vim'
" Show the current git branch in it
Plug 'itchyny/vim-gitbranch'

" color theme
Plug 'ntk148v/vim-horizon'

" 
Plug 'heavenshell/vim-jsdoc'

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

" better prettier base config
let g:prettier#config#tab_width = 4

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

" Js doc es6
let g:jsdoc_enable_es6 = 1

" JS doc generation with Ctrl-L" 
nmap <silent> <C-l> <Plug>(jsdoc)

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

colorscheme horizon

" reload files modified outside of vim 
set autoread
" call file reloading on buf focus change
au FocusGained,BufEnter * :checktime


" Remove preview window"
set completeopt-=preview

" Show line numbers "
set number

"Leader-T to toogle line numbers and git info
function ToggleGutter()
	:set invnumber
	:GitGutterToggle
endfunction

noremap <leader>t :call ToggleGutter()<CR>

" Remove highlight on echap
nnoremap <esc> :noh<return><esc>

" highlight when searching
:set hlsearch

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

