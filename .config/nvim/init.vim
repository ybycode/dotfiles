call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'mbbill/undotree'

" silver searcher plugin
Plug 'rking/ag.vim'

" Theme plugins:
Plug 'junegunn/seoul256.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/sonokai'
Plug 'jacoborus/tender.vim'
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
" a collection of themes
Plug 'rafi/awesome-vim-colorschemes'

" Plugin to remove distraction when editing:
Plug 'junegunn/goyo.vim'

" to center the view:
Plug 'mikewest/vimroom'

"  syntax highlighting:
" do not fancy print CSV files:
let g:polyglot_disabled = ['csv.plugin']
Plug 'sheerun/vim-polyglot' " covers most languages at once

" official plugin for rescript:
Plug 'rescript-lang/vim-rescript'

Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
" "Fast Vue Language Support":
" Plug 'yaegassy/coc-volar', {'do': 'yarn install --frozen-lockfile'}

" Elixir formatter plugin
Plug 'mhinz/vim-mix-format'

" Rust
Plug 'rust-lang/rust.vim'

" Javascript and co. formatter
" (requires prettier to be available somewhere)
Plug 'prettier/vim-prettier', {
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'vue', 'svelte'] }

" Go plugin
Plug 'tweekmonster/gofmt.vim'

" Vim-gitgutter, shows a git diff in the gutter:
Plug 'airblade/vim-gitgutter'

" Fugitive, git wrapper:
Plug 'tpope/vim-fugitive'
" another tool for git:
Plug 'jreybert/vimagit'

" vim-airline, a status bar:
Plug 'vim-airline/vim-airline'

" ListToggle, to easily toggle the quickfix or location window:
Plug 'Valloric/ListToggle'

" Conquer of completion:
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" to preview markdown files in the browser while editing them:
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" Add plugins to &runtimepath
call plug#end()


" Options {{{
syntax on
filetype on
syntax enable
set title                      "set the filename on the terminal title
set expandtab
set shiftwidth=2
set softtabstop=2
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
" something to do with the background color of the terminal over the one
" provided by the vim theme:
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" highlight the 81th character if any:
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

"set backupcopy=yes
set nobackup
set nowritebackup
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


" CoC ("conquer of completion") configuration:
" let g:coc_global_extensions = ['coc-tsserver']
" let g:coc_global_extensions = ['coc-svelte']
" let g:coc_global_extensions = ['coc-volar']
" let g:coc_global_extensions = ['coc-vetur']

" <recommended options for CoC>
set cmdheight=2 " Give more space for displaying messages.
set updatetime=300
set shortmess+=c " Don't pass messages to |ins-completion-menu|.
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" </recommended options for CoC>


set nocompatible
set t_Co=256
" set t_Co=16
set background=dark " dark | light

" Light themes:
" let g:solarized_termcolors=256
" colorscheme solarized
" colorscheme github
" colorscheme PaperColor
" colorscheme one

" " Dark themes:
" colorscheme solarized
" colorscheme seoul256
" colorscheme nord
colorscheme tender

" let g:sonokai_style = 'default' " default | atlantis | andromeda | shusia | maia
" let g:sonokai_enable_italic = 1
" let g:sonokai_disable_italic_comment = 1
" colorscheme sonokai

" set termguicolors     " enable true colors support
" " " let ayucolor="light"  " for light version of theme
" " let ayucolor="light" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu

" autocmd vimenter * ++nested colorscheme gruvbox


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
" map esc to exit the terminal insert mode:
:tnoremap <Esc> <C-\><C-n>
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

nnoremap <silent><leader>a :NERDTreeToggle<CR>

" Ctrl-p plugin:
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>f :CtrlPCurWD<CR>
nnoremap <leader>F :CtrlPMixed<CR>
nnoremap <leader>m :CtrlPMRUFiles<CR>

" CoC diagnostic:
nnoremap <leader>d :CocDiagnostics<CR>

" VimRoom toggle with:
nnoremap <leader>r :VimroomToggle<CR>

" Deoplete plugin for autocompletion:
let g:deoplete#enable_at_startup = 1

"let g:gitgutter_sign_removed_first_line = "^_"

fun! StripTrailingWhitespace()
    %s/\s\+$//e
endfun

augroup options
    autocmd!
    " remove trailing spaces on save:
    autocmd BufWritePre * call StripTrailingWhitespace()

    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
    autocmd FileType vue setlocal shiftwidth=2 tabstop=2
augroup END

augroup ReactFiletypes
  autocmd!
  autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact
  autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact
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

"
" ListToggle bindings:
"
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
"let g:lt_height = 10 " number of lines of the window

" VimRoom settings:
let g:vimroom_sidebar_height = 0
let g:vimroom_width = 100
let g:vimroom_scrolloff = 0

" gofmt settings:
let g:gofmt_exe = 'goimports'

" Format elixir files on save:
let g:mix_format_on_save = 1
" same with rust:
let g:rustfmt_autosave = 1

" Run prettier for JS files and co. on save:
" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0

" let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.module.scss,*.json,*.graphql,*.vue,*.svelte, PrettierAsync
