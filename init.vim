" Settings
filetype off                  " required
set backspace=indent,eol,start  " more powerful backspacing
set number
set tabstop=4
filetype indent on
set shiftwidth=4
set expandtab
set smarttab
set ruler
set showcmd
set background=dark
set previewheight=22
set hidden

" Plugins
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'neomake/neomake'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'jnurmine/Zenburn'
Plug 'sjl/badwolf'
Plug 'plasticboy/vim-markdown'
Plug 'jpalardy/vim-slime'
Plug 'ervandew/supertab'
Plug 'elzr/vim-json'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'sheerun/vim-polyglot'
Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-fireplace'
Plug 'Olical/conjure'
Plug 'tpope/vim-surround'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'venantius/vim-cljfmt'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'vim-scripts/paredit.vim'
Plug 'w0rp/ale'
Plug 'ncm2/float-preview.nvim'
" "Plug 'jiangmiao/auto-pairs', { 'tag': 'v2.0.0' }
" Plug 'python-mode/python-mode'
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'vim-syntastic/syntastic'
call plug#end()

let g:jedi#force_py_version=3
" Enable Vim Slime with tmux
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:ycm_autoclose_preview_window_after_completion = 0
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('keyword_patterns', {'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*'})
set completeopt-=preview

let g:float_preview#docked = 0
let g:float_preview#max_width = 80
let g:float_preview#max_height = 40
" let g:neomake_python_enabled_makers = ['pylint']
" call neomake#configure#automake('nrwi', 500)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']

let g:ale_linters = {
            \ 'clojure': ['cli-kondo', 'joker']
            \}
" Configure shortcut for nerdtree toggle
nmap <C-n> :NERDTreeToggle<CR>

" Appearance
syntax enable
syntax on
set noswapfile
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" set background=dark
" colorscheme gruvbox
" autocmd VimEnter * colorscheme molokai
autocmd VimEnter * colorscheme badwolf
" let g:python_space_error_highlight=0
" let g:toggleHighlightWhitespace=0
" let g:go_highlight_trailing_whitespace_error=0
" let g:pymode_syntax_space_errors=0
"
"make kj do esc"
" inoremap kj <Esc>
" KJ
