" Settings
set backspace=indent,eol,start 
" more powerful backspacing
set number
set tabstop=4
filetype plugin indent on
set autoindent
set shiftwidth=4
set expandtab
set smarttab
set ruler
set showcmd
" set cmdheight=4
set cmdheight=2
set previewheight=4
set hidden
set textwidth=80

" This has to be before plugins so that coc and ale can play together
let g:ale_disable_lsp = 1
" let g:ale_completion_enabled = 1

" Plugins
call plug#begin()

" git plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" show file tree
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'preservim/tagbar'

" Fuzzy Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Colorthemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'tomasr/molokai'
Plug 'sainnhe/sonokai'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'

" Nice airline format at bottom of screen
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Slime for vim, send things to different tmux pane
Plug 'jpalardy/vim-slime'

" Tab completion
Plug 'ervandew/supertab'
Plug 'elzr/vim-json'
Plug 'sheerun/vim-polyglot'

" Clojure Plugins if I ever get around to learning
Plug 'Olical/conjure'
Plug 'tpope/vim-surround'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'venantius/vim-cljfmt'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-fireplace'

" Automatch paired symbols like parens, quotes, etc.
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'

" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver'
Plug 'weirongxu/coc-explorer'

Plug 'dense-analysis/ale'

" F--ing linting
Plug 'plasticboy/vim-markdown'
Plug 'Vimjas/vim-python-pep8-indent'
call plug#end()

" configure fzf
nnoremap <silent> <Space>f :FZF <Space>
nnoremap <silent> <Space>ff :FZF<cr>
nnoremap <silent> <Space>F :FZF ~<cr>
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }

" Search within files
nnoremap <silent> <Space>g :Rg<cr>

" Search open buffers
nnoremap <silent> <Space>b :Buffers<cr>


" Enable Vim Slime with tmux
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"

let g:coc_user_config = {}
let g:coc_user_config['coc.preferences.jumpCommand'] = ':SplitIfNotOpen4COC'
set completeopt+=preview
let g:float_preview#docked = 1
let g:float_preview#max_width = 80
let g:float_preview#max_height = 40
" let g:markdown_folding = 1
let g:vim_markdown_folding_disabled = 1

" call neomake#configure#automake('w')
set statusline+=%#warningmsg#
set statusline+=%*

let g:tagbar_ctags_bin="/usr/bin/ctags"
" let g:coc_node_path="~/bin/node-v14.15.1-linux-x64/bin/node"


let g:ale_linters = {'python': ['autopep8'],'clojure': ['cli-kondo', 'joker'],'markdown': ['markdownlint']}
" Configure shortcut for nerdtree toggle
nnoremap <Space>n :NERDTreeToggle<CR>

" Configure shortcut for tagbar toggle
nnoremap <Space>t :TagbarToggle<CR>

" Remap ctrl-w to space for split nav
nnoremap <Space> <C-w>

nnoremap <Space> <Tab> :bp<CR>


" Appearance
syntax enable
syntax on
" set foldmethod=syntax
set noswapfile
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set foldopen -=hor

" set completeopt-=menu,preview
" set completeopt+=menuone
let g:coc_user_config = {}
let g:coc_user_config['coc.preferences.jumpCommand'] = ':SplitIfNotOpen4COC'

" colorscheme
autocmd VimEnter * colorscheme PaperColor
autocmd VimEnter * AirlineTheme gruvbox
set background=dark 

" let g:airline_theme='gruvbox'


" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tagbar#enabled = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled=1


