" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle, required
" :BundleInstall to update or install new bundles
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
" Surround
Bundle 'tpope/vim-surround'
" Git changes
Bundle 'airblade/vim-gitgutter'
" Color Themes
Bundle 'flazz/vim-colorschemes'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'wikitopian/hardmode'
" comment/uncomment lines with gcc or gc in visual mode
Bundle 'tpope/vim-commentary'
" the ultimate git helper
Plugin 'tpope/vim-fugitive'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
" Setting up Vundle - the vim plugin bundler end


" Set 'nocompatibl:e' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Enable syntax highlighting
syntax on

" Display line number
set number

colorscheme Monokai
" Improve the search highlight
hi Search ctermbg=Blue

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Highlight searches
set hlsearch

" Ignore case by default except if a capital letter is used
set ignorecase
set smartcase

" Visual but no sound on error
"set visualbell

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Enable use of the mouse for all modes
set mouse=a

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Ctrl-n to open NerdTree
map <C-n> :NERDTreeToggle<CR>
" Different highlight for different file extensions
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set encoding=utf-8

" Fix tabs
set shiftwidth=4
set softtabstop=4
set expandtab

" Hard Mode
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" git commit
autocmd Filetype gitcommit setlocal spell textwidth=72

" Toggle line number
let g:NumberToggleTrigger="<C-r>"

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set rtp+=/usr/local/opt/fzf