call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'


" Theme plugins:
Plug 'junegunn/seoul256.vim'
Plug 'altercation/vim-colors-solarized'

" Plugin to remove distraction when editing:
Plug 'junegunn/goyo.vim'

" Syntaxic coloration for TypeScript:
Plug 'leafgarland/typescript-vim'

" completion:
Plug 'shougo/deoplete.nvim'

" Elixir plugin
Plug 'elixir-lang/vim-elixir'

" Elm plugin
Plug 'lambdatoast/elm.vim'

" Rust plugins
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" Neomake, kind of new syntastic:
Plug 'benekastah/neomake'

" Vim-gitgutter, shows a git diff in the gutter:
Plug 'airblade/vim-gitgutter'

" vim-airline, a status bar:
Plug 'vim-airline/vim-airline'

" ListToggle, to easily toggle the quickfix or location window:
Plug 'Valloric/ListToggle'

" Add plugins to &runtimepath
call plug#end()


" Options {{{
syntax on
filetype on
syntax enable
set title                      "set the filename on the terminal title
set expandtab
set shiftwidth=4
set softtabstop=4
set smartindent
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set number                      " show the line numbers
set numberwidth=4               " Use relative line numbering
set relativenumber              " but absolute for the current line.
set showmatch                   " set show matching parenthesis
set hlsearch                    " highlight search terms
set ignorecase                  " case insensitive search
set smartcase                   " take case into account some capital letters are given
set incsearch                   " show search matches as you type
highlight ColorColumn ctermbg=magenta      "  highlight the 81th
call matchadd('ColorColumn', '\%81v', 100) "  character if any
"set backupcopy=yes
set nobackup
set noswapfile
set mouse=a 	                " enable the mouse
" wrap settings (cf. http://vim.wikia.com/wiki/Word_wrap_without_line_breaks)
set wrap                        " visually wrap
set linebreak                   " only break a character in the breakat option
set nolist                      " nolist disables linebreak
set whichwrap+=<,>,h,l,[,]      " causes the left and right arrow keys, as well as h and l,
                                " to wrap when used at beginning or end of lines
set encoding=utf-8              " The encoding displayed.
set fileencoding=utf-8          " The encoding written to file.
set showcmd                     " show command as you type
"set cursorline
"hi Cursorline ctermbg=darkgrey guibg=#771c1c cterm=none " highlight the line
set hidden                      " allow to hide a modified buffer
set confirm                     " asks for confirmation before closing an unsaved buffer
set wildchar=<Tab> wildmenu wildmode=full " enables a tab completion with a menu
                                          " when typing a command
"set switchbuf=usetab
set foldmethod=indent
set foldlevel=99
set scrolloff=5
set laststatus=2
set splitbelow
set splitright
" persistent undos:
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
set wildignore=*.swp,*.bak,*.pyc


set background=dark
"colorscheme wombat " distinguished, molokai, solarized
"colorscheme seoul256

" specifics for solarized (https://bbs.archlinux.org/viewtopic.php?id=164108):
"let g:solarized_termcolors=256
set nocompatible
set t_Co=16
set background=dark " dark | light "
colorscheme solarized
" end specifics


" Mappings {{{
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
" use leader w for saving:
nnoremap <silent><leader>w :update<CR>
"use jk for escape insert mode:
inoremap jk <esc>
" Switch between the last two files
nnoremap <leader><leader> <c-^>
" window navigation with the control key:
noremap <C-h> <C-W>h
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l
" remove highlight of search when asked:
nnoremap <silent> <leader>n :nohlsearch<CR>
" Do not exit visual mode when shifting:
vnoremap > >gv
vnoremap < <gv
"drag visual block
vnoremap <C-K> xkP`[V`]
vnoremap <C-J> xp`[V`]
vnoremap <C-L> >
vnoremap <C-H> <gv
" remove highlight of search when asked:
nnoremap <silent> <leader>n :nohlsearch<CR>

nnoremap <silent><leader>a :NERDTreeToggle<CR>

" Ctrl-p plugin:
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>f :CtrlPCurWD<CR>
nnoremap <leader>F :CtrlPMixed<CR>
nnoremap <leader>m :CtrlPMRUFiles<CR>

" Deoplete plugin for autocompletion:
let g:deoplete#enable_at_startup = 1

" options for vim-racer:
let g:racer_cmd = "racer"
let $RUST_SRC_PATH="/mnt/data/code/rust-src/src/"
"
"let g:gitgutter_sign_removed_first_line = "^_"

" for the racer autocompletion to work with deoplete, I had to copy
" this racer.py file (https://github.com/racer-rust/vim-racer/tree/master/rplugin/python3/deoplete/sources) here:
" mv racer.py ~/.vim/plugged/deoplete.nvim/rplugin/python3/deoplete/sources/

augroup options
    autocmd!
    " remove trailing spaces on save:
    autocmd BufWritePre * :%s/\s\+$//e
augroup END

"
" Neomake options:
"
let g:neomake_logfile="/home/yann/neomake.log"
" open the location list when neomake is run:
"let g:neomake_open_list = 2
let g:neomake_javascript_enabled_makers = ['eslint']
" for c++11:
let g:neomake_cpp_enabled_makers=['clang']
let g:neomake_cpp_clang_args = ["-std=c++11"]

augroup plugins_autocmds
    autocmd!
    autocmd! BufWritePost,BufEnter * Neomake
augroup END

"
" ListToggle bindings:
"
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
"let g:lt_height = 10 " number of lines of the window
