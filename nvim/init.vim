call plug#begin('/opt/nvim/plugged')

" find file with ctrl P
Plug  'ctrlpvim/ctrlp.vim'

" move selection vertically => ctrl J - ctrl L
Plug 'matze/vim-move'

" async things
Plug 'neomake/neomake'

" ctrl N to multiple cursor (then visual mode => C to replace words) 
Plug 'terryma/vim-multiple-cursors'

" nerdTree classic (tab to toogle, leader-N : reveal current buffer in it)
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" auto format
Plug 'sbdchd/neoformat'

" Show git info in the gutter (Leader-G to toogle)
Plug 'airblade/vim-gitgutter'

" last used files (f2)
Plug 'yegappan/mru',

" Show infos about current file... etc => bottom bar 
Plug 'itchyny/lightline.vim'

" color theme
Plug 'ntk148v/vim-horizon'

" Auto close things
Plug 'Raimondi/delimitMate'

" Color picker
Plug 'KabbAmine/vCoolor.vim'

" Commenter ( <leader>cc to comment)
Plug 'scrooloose/nerdcommenter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'wincent/ferret'

" completion doc shwon in command line
" Plug 'Shougo/echodoc.vim'

" tab use for completion
" Plug 'ervandew/supertab'

" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" ------GIT PLUGINS
"
" Git plugin 
Plug 'tpope/vim-fugitive'

" Show the current git branch in it
Plug 'itchyny/vim-gitbranch'

" ------PYTHON PLUGINS ------


" python linter
Plug 'nvie/vim-flake8', { 'do': 'pip3 install flake8'}

" ---- JS PLUGINS ---------

" Auto complete, with ternjs
" nice doc :  http://gregjs.com/vim/2016/neovim-deoplete-jspc-ultisnips-and-tern-a-config-for-kickass-autocompletion/
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" vue highlights
Plug 'posva/vim-vue'


" es6 higlight
Plug 'isRuslan/vim-es6'

" advanced js
Plug 'pangloss/vim-javascript'

" jsdoc 
Plug 'heavenshell/vim-jsdoc'

" linter eslint, fix current file with leader-f
Plug 'w0rp/ale'

" -- PHP PLUGINS---
"
" symfony - twig
Plug 'nelsyeung/twig.vim'

" prettier : leader-P
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --global prettier',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }


" Tabs in buffers
" Plug 'ap/vim-buftabline'

call plug#end()


" -----  CONFIG FOR COC
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    call CocAction('doHover')
endfunction


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap ,m <Plug>(coc-rename)

" Update signature help on jump placeholder.
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" light-line
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" tern things
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:tern#filetypes = [ 'js', 'vue' ]

" let g:python3_host_prog='C:/Python37/python.exe'
" let g:python_host_prog='C:/Python27/python.exe' 

" NERD Commenter : Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

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

" -- research in Files, disable preview because it doesn't work (on windows)
"  INSTALL ag for search
let g:fzf_preview_window = ''


" --- LINTER ------
" "let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {
            \'javascript': ['eslint'],
            \'vue': ['eslint', 'stylelint'],
            \'less': ['stylelint'],
            \}
let g:ale_fixers = {
            \'javascript': ['eslint'],
            \'vue': ['eslint','stylelint'],
            \'less': ['stylelint'],
            \}
let g:ale_linter_aliases = { 'vue': ['less','javascript']}
let g:ale_fixer_aliases = { 'vue': ['less','javascript']}
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

" Bottom line : 
" display branch name
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name',
      \   'cocstatus': 'coc#status'
      \ },
      \ }


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

" search for selection when typing //
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

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

" duplicate selection with alt D
vmap <M-d> y'>p

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
:set foldlevelstart=1

" smart case when doing search in a file
:set ignorecase
:set smartcase

" Spaces & Tabs {{{
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set smartindent
set copyindent      " copy indent from the previous line
" }}} Spaces & Tabs

" copy paste on windows
set clipboard^=unnamed,unnamedplus


