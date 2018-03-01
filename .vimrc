set nocompatible " Use Vim settings instead of Vi Must be first

" General Config
set mouse=a                " Mouse use
set history=1000           " Reduce Vim's short-term memory loss
set number                 " Numbers in gutter
set spell                  " Spell checking
set hidden                 " Allows current buffer to be moved to background without writing to disk
set termguicolors
set clipboard=unnamed
syntax enable              " Turns on Syntax
runtime macros/matchit.vim " Allows % to switch between if/else/etc.

" Leader
nnoremap <SPACE> <Nop>
nmap <SPACE> <leader>
map <space><space> <leader><leader>
nmap <silent> <leader>w :w <CR>
nmap <silent> <leader>wq :wq <CR>
nmap <silent> <leader>q :q <CR>
nmap <silent> <leader><Tab> :bn <CR>
nmap <silent> <leader>m :ALEToggle <CR>
nmap <silent> <leader>l :set relativenumber! <CR>
nmap <silent> <leader>s :Gstatus <CR>
nmap <silent> <leader>c :Gcommit <CR>

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'                              " Why not

Plug 'bling/vim-airline'                               " Airline
Plug 'vim-airline/vim-airline-themes'                  " Airline Themes
Plug 'bling/vim-bufferline'                            " Airline Buffer Line
Plug 'flazz/vim-colorschemes'                          " Colorschemes
Plug 'tpope/vim-fugitive'                              " Fugitive for Git
Plug 'airblade/vim-gitgutter'                          " Gitgutter
Plug 'Yggdroot/indentLine'                             " Indent
Plug 'jceb/vim-orgmode'                                " Org mode
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " NERD tree open on ctrl-n
Plug 'tomlion/vim-solidity'                            " Solidity Language Supprt
Plug 'dmdque/solidity.vim'                             " Solidity Compiler
Plug 'scrooloose/syntastic'                            " Syntax Checking

call plug#end()


" Move by 'display lines' rather than 'logical lines' if no v:count was
" provided.  When a v:count is provided, move by logical lines.
" Useful for writing in vim
nnoremap <expr> j v:count > 0 ? 'j' : 'gj'
xnoremap <expr> j v:count > 0 ? 'j' : 'gj'
nnoremap <expr> k v:count > 0 ? 'k' : 'gk'
xnoremap <expr> k v:count > 0 ? 'k' : 'gk'

" Ensure 'logical line' movement remains accessible.
nnoremap <silent> gj j
xnoremap <silent> gj j
nnoremap <silent> gk k
xnoremap <silent> gk k

" --------- Plugin Mods -------------

" Airline 
set ttimeoutlen=10 " Fix the slight delay between switching vim modes
" Fixing airline symbols
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"
set laststatus=2
let g:airline_skip_empty_sections = 1

" NERD tree
map <c-n> :nerdtreetoggle<cr>  
nnoremap <c-b> :undotreetoggle<cr>

let NERDTreeShowHidden=1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
