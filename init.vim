call plug#begin()
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'jpalardy/vim-slime'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'roxma/nvim-completion-manager'
Plug 'ycm-core/YouCompleteMe' 
" Plug 'dag/vim2hs' 
" Plug 'SirVer/ultisnips'
" Plug 'itchyny/vim-haskell-indent'
" Plug 'honza/vim-snippets'
Plug 'neovimhaskell/haskell-vim' 
" Plug 'enomsg/vim-haskellConcealPlust'
" Plug 'alx741/vim-hindent'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'sickill/vim-monokai'
call plug#end()

let g:deoplete#enable_at_startup = 1
syntax on

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set background=dark
let g:airline_theme='one'
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
colorscheme gruvbox
set number

let g:slime_target="tmux"

let python_highlight_all=0

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" Turn these off if they fuck up python indents
let g:haskell_indent_disable = 1
" set autoindent
" set nocindent

set shortmess=a
set cmdheight=2
