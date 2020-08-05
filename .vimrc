:set number
:let mapleader = ","

:set cursorline

" Refresh externally changed files"
:set autoread

" Enable per project vimrc file"
set exrc

syntax on
"autocmd Filetype gitcommit spell textwidth=72

" Omni complete"
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Vim split
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open vim split to the right and bottom
set splitbelow
set splitright

" Vundel configuratio

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize

call plug#begin('~/.vim/plugged')
" My " Plugin list here
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-abolish'
Plug 'scrooloose/nerdtree'

" Navigate properly
Plug 'bkad/CamelCaseMotion'
"Plug 'AutoClose'

"Comment lines
Plug 'scrooloose/nerdcommenter'

" Eainsy navigation
"Plug 'EasyMotion'

" Fuzzy file finder
Plug 'ctrlpvim/ctrlp.vim'

" yaml/yml support
Plug 'avakhov/vim-yaml'

" Elixir plugins"
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
" Autocomplete for Elixir
" Plugin 'slashmili/alchemist.vim'

" Nice looking status bar
Plug 'vim-airline/vim-airline'

" Auto close replacement
" Plugin 'Townk/vim-autoclose'

" Visually display indent levels
"" Plugin 'nathanaelkane/vim-indent-guides'

" Syntax checking hacks for vim
Plug 'scrooloose/syntastic'

" A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plug 'airblade/vim-gitgutter'

" Emmet for vim
Plug 'mattn/emmet-vim', { 'for': 'html' }

"" Elm plugin
Plug 'ElmCast/elm-vim', { 'for': 'elm'}

" Tern
"" Plugin 'ternjs/tern_for_vim'
" Autocomplete
"" Plugin 'valloric/youcompleteme'

" snippets
"" Plugin 'sirver/ultisnips'

" Sublime like multiple cursors
Plug 'terryma/vim-multiple-cursors'

" surround
Plug 'tpope/vim-surround'

" code snippets program
"" Plugin 'MarcWeber/vim-addon-mw-utils'
"" Plugin 'tomtom/tlib_vim'
"" Plugin 'garbas/vim-snipmate'

" Code snipets repo
"" Plugin 'honza/vim-snippets'

call plug#end()
filetype plugin indent on
filetype plugin on

" Configure tab for different kind of files
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4
autocmd FileType scss,css setlocal shiftwidth=4 tabstop=4
autocmd FileType elm setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType html setlocal shiftwidth=4 tabstop=4

" Remove esc timeout"
"set timeout
"set ttimeoutlen=0
set ttimeout
set ttimeoutlen=250
set notimeout
set lazyredraw

" Ctrl P custom ignore"
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|deps|node_modules|_build)$',
  \ 'file': '\v\.(DS_Store)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Elixir do/end"
inoremap do<cr> do<cr>end<c-o>O
autocmd FileType elixir inoremap -><cr> -><cr>end<c-o>O


"Emmer tab in html
autocmd FileType html imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Disable unsafe commands in project specific vimrc files"
set secure

" Set highlight search
set hlsearch

" Vim airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Smart indentatino"
filetype plugin indent on

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Show cr in the end of line
"set lcs=eol:⏗
"set list

" Elm plugin config
let g:elm_format_autosave = 1

" Elm colors config
" Yellow let/in
autocmd Filetype elm syn keyword myElmTypedef let in
autocmd Filetype elm hi! def link myElmTypedef Statement

" pink type portj
autocmd Filetype elm syn keyword elmTypedef type port
autocmd Filetype elm hi! def link elmTypedef Include

" Green types
autocmd Filetype elm hi! def link elmType Type

" Get the current type 
"map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#") . " BG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"bg#")<CR>



" Fix copy paste mac
"set clipboard=unnamed

" Vim changed the default color scheme in the latest update
colorscheme peachpuff
