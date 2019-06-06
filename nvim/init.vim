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
" nice doc :  http://gregjs.com/vim/2016/neovim-deoplete-jspc-ultisnips-and-tern-a-config-for-kickass-autocompletion/
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif


Plug 'ervandew/supertab'

Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for': ['javascript', 'javascript.jsx'] }

Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

"Typescript Plugins
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" last used files (f2)
Plug 'yegappan/mru',

" vue highlights
Plug 'posva/vim-vue'

" es6 higlight
Plug 'isRuslan/vim-es6'

" advanced js
Plug 'pangloss/vim-javascript'

" linter eslint, fix current file with leader-f
Plug 'w0rp/ale'

" prettier : leader-P
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --global prettier',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

" Show git info in the gutter (Leader-G to toogle)
Plug 'airblade/vim-gitgutter'

" Show infos about current file... etc => bottom bar 
Plug 'itchyny/lightline.vim'
" Show the current git branch in it
Plug 'itchyny/vim-gitbranch'

" color theme
Plug 'ntk148v/vim-horizon'

" jsdoc 
Plug 'heavenshell/vim-jsdoc'

" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Git plugin 
Plug 'tpope/vim-fugitive'

" Auto close things
Plug 'Raimondi/delimitMate'

call plug#end()

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
" let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
" call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:deoplete#sources#tss#javascript_support = 1
let g:nvim_typescript#javascript_support = 1


" let g:python3_host_prog='C:/Python37/python.exe'
" let g:python_host_prog='C:/Python27/python.exe' 

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

" leader + n:  Reveal current buffer in nerdtree
nmap ,n :NERDTreeFind<CR>

"-------End NERDTREE Section -------------

" --- LINTER ------
" "let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {
            \'javascript': ['eslint'],
            \'vue': ['eslint'],
            \}
let g:ale_fixers = {
            \'javascript': ['eslint'],
            \'vue': ['eslint'],
            \}
let g:ale_completion_enabled = 1
" let g:ale_fix_on_save = 1
nmap ,f <Plug>(ale_fix)

" better prettier base config
let g:prettier#config#tab_width = 4

" ---- JS part -----

" ignore node modules for ctrl p
let g:ctrlp_custom_ignore = { 'dir': 'build$\|node_modules$' }

"js doc highlighting
let g:javascript_plugin_jsdoc = 1

" Js doc es6
let g:jsdoc_enable_es6 = 1

" JS doc generation with Leader D" 
nmap ,d <Plug>(jsdoc)

" Tern Def on F12
autocmd FileType javascript map <F12> :TernDef<CR>
autocmd FileType javascript map <leader><F12> :TernDefPreview<CR>

" ---- END JS Part

" super tab (tab for decomplete)
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


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

" Remove preview window"
" set completeopt-=preview
let g:SuperTabClosePreviewOnPopupClose = 1

"F2 Shortcut for Most Recently Used Files
map <F2> :MRU<CR>

"Move line or selection vertically with Ctrl J and Ctrl K"
let g:move_key_modifier = 'C'

"map leader"
let mapleader = ","                                             
let g:mapleader = ","                                                                   

colorscheme horizon

" reload files modified outside of vim 
set autoread
" call file reloading on buf focus change
au FocusGained,BufEnter * :checktime



" Show line numbers "
set number

"Leader-G to toogle gutter
function ToggleGutter()
	if &scl == "no"
	    echom "scl to auto"
	    :set scl=auto
    else 
        echom "scl to no"
        :set scl=no
    endif
	:set invnumber
endfunction
noremap <leader>g :call ToggleGutter()<CR>

" git gutter no support fot focus gained
let g:gitgutter_terminal_reports_focus=0
set updatetime=750

" Remove highlight on echap
nnoremap <esc> :noh<return><esc>

" highlight when searching
:set hlsearch

" Indents word-wrapped lines as much as the 'parent' line
set breakindent
" Ensures word-wrap does not split words
set formatoptions=l
set lbr

" folding
:set foldmethod=indent

" Spaces & Tabs {{{
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line
" }}} Spaces & Tabs

" auto close things
""inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O


