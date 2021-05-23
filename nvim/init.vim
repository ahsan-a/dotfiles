set nocompatible

filetype off
call plug#begin('~/AppData/Local/nvim/plugged')

" Plug Manager
Plug 'gmarik/Vundle.vim'
" Bottom status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" nord plugin
Plug 'arcticicestudio/nord-vim'
"use \t to open file tree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
" I don't know what this does but it seems cool
Plug 'xolox/vim-misc'
Plug 'szw/vim-tags'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/a.vim'
" ----- Working with Git ----------------------------------------------
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
"language
Plug 'sheerun/vim-polyglot'
" ----- Other text editing features -----------------------------------
Plug 'Raimondi/delimitMate'
" ---- Extras/Advanced plugins ----------------------------------------
" Highlight and strip trailing whitespace
Plug 'ntpeters/vim-better-whitespace'
" Easily surround chunks of text
Plug 'tpope/vim-surround'
" Align CSV files at commas, align Markdown tables, and more
"Plug 'godlygeek/tabular'
" Automaticall insert the closing HTML tag
"Plug 'HTML-AutoCloseTag'
" Make tmux look like vim-airline (read README for extra instructions)
"Plug 'edkolev/tmuxline.vim'
" All the other syntax plugins I use
"Plug 'ekalinin/Dockerfile.vim'
"Plug 'digitaltoad/vim-jade'
"Plug 'tpope/vim-liquid'
Plug 'ycm-core/YouCompleteMe'
" syntax checking
Plug 'dense-analysis/ale'

call plug#end()
filetype plugin indent on

set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

" 256 bit colour and powerline fonts for arrow stuff
let g:solarized_termcolors=256
let g:airline_powerline_fonts = 1

set background=dark
" nord colourscheme
colorscheme nord
set laststatus=2
"not run commands on paste
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1

"nerdtree stuff
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 0

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- airblade/vim-gitgutter settings -----
" Required ag changed the colorscheme
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ----- ALE stuff -----
let b:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['autoimport', 'autopep8', 'black', 'isort', 'yapf'],
\   'javascript': ['prettier', 'eslint']
\}
let g:ale_fix_on_save = 1

" ----- Ctags -----
let g:tagbar_ctags_bin = 'C:\shell\ctags.exe'

set encoding=utf-8

:set mouse=a
:set shell=powershell
syntax on
