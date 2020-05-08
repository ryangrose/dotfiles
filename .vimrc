""""""""""""""""""""""""""""""""""""""""""""""""""
"
"
" Vim configuration file
" - Ryan Grose
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""
" General settings
"""""""""""""""""""


" Fix terminal coloring
set t_ut=

" Enable 256 colors palette in Gnome Terminal
set t_Co=256

" Word wrapping
set wrap
set linebreak
set nolist

" Match indent to file
filetype indent on

" Enable folding
set foldmethod=indent
set foldlevel=99

"Make search ignore case
set ignorecase

" Allows for realtime regex testing
set incsearch

" Override 'ignorecase' if search contains capitals
set smartcase

" Don't close buffers when you move away from them for a sec...
" Just hide 'em!
set hidden

" Enable syntax highlighting
syntax on

" Relative line numbering on the left-hand side and absolute numbering on the
" current line
set relativenumber
set number

" Expands tabs into spaces for better cross-platform viewing
set expandtab

" No more jerking the page halfway over for text that extends
" beyond the screen width
set sidescroll=1

" Default to 4 space tabs for unknown filetypes
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Match indents on new lines intelligently
set autoindent
set smartindent

" Turn on omni-completion <C-X><C-O>
set omnifunc=syntaxcomplete#Complete

"""""""""""""""""""""""""""""
" Language Specific Settings
"""""""""""""""""""""""""""""


"
" Python
"

let python_highlight_all=1

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

"
" Web Dev
"

au BufNewFile,BufRead *.js
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |

au BufNewFile,BufRead *.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

"""""""""""""""
" Key Bindings
"""""""""""""""


" Don't want to press shift to go into command mode
nnoremap ; :
vnoremap ; :

" Reload buffer if file has been externally modified
set autoread

" Stay in place while joining lines
nnoremap J mzJ`z

" Make space the leader key (basically, a key that you can use to add other
" bindings. the idea being that you can change it later to be like... ',' or
" something and all of your leader-prefixed mappings still work, just with commas
" now)
let mapleader = "\<Space>"

" Switch to the previous buffer (since space is the leader key, this is
" equivalent to <Space><Tab>)
nnoremap <Leader><Tab> :b#<CR>

" Make background transparent
map <F2> :hi Normal guibg=NONE ctermbg=NONE<CR>

" easy-pandoc-templates
noremap <Leader>o :! pandoc '%:p' -o /tmp/'%:p:t'.html --template=clean_menu.html --toc --highlight-style=zenburn && firefox /tmp/'%:p:t'.html &<CR><CR>
noremap <silent> <Leader>m :! pandoc '%:p' -o /tmp/'%:p:t'.html --template=clean_menu.html --toc --highlight-style=zenburn<CR><CR>
noremap <C-\> :! filewatcher '%:p' 'pandoc '%:p' -o /tmp/'%:p:t'.html --template=elegant_bootstrap_menu.html --toc' &<CR>

"
" Splits
"

" Easier split maneuvering
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Faster splits with leader mappings
nnoremap <Leader>\ :vs<CR>
nnoremap <Leader>- :sp<CR>

" Escape used to be closer to where the caps lock key is now, so instead,
" others and I use "jk" to return to command mode, since it's on home row, and
" those two consecutive keys come up surprisingly infrequently
"
" I mapped Caps Lock to ESC at OS level instead, so use this on foreign
" machines (likea school computer)
"
" inoremap jk <ESC>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins - vim-plug https://github.com/junegunn/vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.

" Classic utility
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'tpope/vim-unimpaired'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'enricobacis/vim-airline-clock'

" Syntax
" Plug 'w0rp/ale'
" Plug 'vim-syntastic/syntastic'
" Plug 'Valloric/YouCompleteMe'

" For Python
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
Plug 'vim-scripts/indentpython.vim', {'for': 'python'}
Plug 'nvie/vim-flake8', {'for': 'python'}
Plug 'hdima/python-syntax', {'for': 'python'}

" For html
Plug 'alvan/vim-closetag'

" For js
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" Plug 'hallettj/jslint.vim'
" Plug 'wookiehangover/jshint.vim'

" For haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'dag/vim2hs'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'eagletmt/neco-ghc'
Plug 'eagletmt/ghcmod-vim'
Plug 'enomsg/vim-haskellConcealPlus'

" For dart
Plug 'dart-lang/dart-vim-plugin'

" Colorscheme
Plug 'morhetz/gruvbox'
Plug 'AlessandroYorba/Despacio'
Plug 'AlessandroYorba/Alduin'
Plug 'dylanaraps/wal.vim'

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax' 
Plug 'LnL7/vim-nix'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

""""""""""""""""""
" Plugin settings
""""""""""""""""""

" NERD commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Ctrl P
" Open new tab instead of replace
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }

" ignore node_modules
set wildignore+=*/node_modules/*,
let g:ctrlp_custom_ignore = '*/node_modules/*'

" SimpylFold
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_import = 1

" Flake8
" auto run on write
" autocmd BufWritePost *.py call Flake8()

" Haskell - ghc-mod
autocmd FileType haskell map <silent> tw :GhcModTypeInsert<CR>
autocmd FileType haskell map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""''
" Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""''
" 
" Set colorscheme
colo gruvbox
set background=dark
hi Normal ctermbg=None
" colo despacio
" colo wal
" let g:airline_theme='solarized'
let g:airline_theme='ayu_mirage'


"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Stuff in testing
"""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>t i<++><ESC>hh
nnoremap <Leader>f /<+.*+><CR>ll
set scrolloff=3
nnoremap ;; ;
vnoremap ;; ;
"
" source $MYVIMRC reloads the saved $MYVIMRC
:nmap <Leader>s :source $MYVIMRC<CR>

" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
:nmap <Leader>v :tabedit $MYVIMRC<CR>
:nmap <Leader>b :colo gruvbox<CR>
