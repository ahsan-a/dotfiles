set nocompatible

call plug#begin('~/AppData/Local/nvim/plugged')

" ----- Editor customisation -----
Plug 'vim-airline/vim-airline'
" Rainbow brackets
Plug 'luochen1990/rainbow'
Plug 'arcticicestudio/nord-vim'
" Discord RPC
Plug 'andweeb/presence.nvim'

Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

"Language pack
Plug 'sheerun/vim-polyglot'
"Accidental whitespace
Plug 'ntpeters/vim-better-whitespace'

" ----- Utilities -----
"gcc to comment line
Plug 'tpope/vim-commentary'
"easily show git statuses
Plug 'airblade/vim-gitgutter'
"(), '' etc.
Plug 'Raimondi/delimitMate'

" Linter
Plug 'dense-analysis/ale'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}


call plug#end()
filetype plugin indent on

" ----- Plugin Setup -----
" -- gitgutter --
let g:gitgutter_git_executable = 'C:\Program Files\Git\bin\git.exe'

" -- nerdtree --
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>

" -- Rainbow Brackets --
let g:rainbow_active = 1

" -- Airline --
let g:airline_powerline_fonts = 1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1 "enable the top statusbar at all times

" -- ale --
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier','eslint'],
\}
let g:ale_fix_on_save = 1

" -- coc --
set pumheight=20
inoremap <silent><expr> <c-space> coc#refresh()
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" -- discord RPC ---
let g:presence_neovim_image_text = "Neo"

" ----- Looks -----
set background=dark
colorscheme nord
set shiftwidth=4

" ----- Editor Customisation -----
set backspace=indent,eol,start
set number
set ruler
set mouse=a
syntax on
