
"------------------------------------------------------------
" Features {{{1
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on

" Show line numbers
set number

"------------------------------------------------------------
" Must have options {{{1
"

" set this so you don't have to save buffers to change them
set hidden


" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=1

set previewheight=4

"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

set noswapfile

"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
" TODO: map space in place of CTRL-W
" 


" Plugins
call plug#begin()
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
Plug 'jpalardy/vim-slime'
Plug 'sillybun/vim-repl'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'preservim/tagbar'
Plug 'junegunn/fzf'
Plug 'tpope/vim-fireplace'
Plug 'Olical/conjure'
Plug 'tpope/vim-surround'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'venantius/vim-cljfmt'
Plug 'tpope/vim-salve'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'vim-syntastic/syntastic'
Plug 'altercation/vim-colors-solarized'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'gruvbox-material/vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

let g:coc_global_extensions = ['coc-conjure', 'coc-python']


" Make vimslime work with tmux
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"

set background=light
let g:airline_theme='papercolor'
colorscheme PaperColor

" let g:gruvbox_contrast_light='hard'
" let g:airline_theme='papercolor'
" set background=light
" colorscheme gruvbox
