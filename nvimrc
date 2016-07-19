" be iMproved
set nocompatible
" required
filetype off

set shell=/bin/bash
set rtp+=~/.config/nvim/bundle/Vundle.vim/
call vundle#begin('~/.config/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My Plugins here:
"
" original repos on github
" Git
Plugin 'tpope/vim-fugitive'

" Status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Editing
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'altercation/vim-colors-solarized'

" Paredit
Plugin 'Raimondi/delimitMate'

" visual clues for indentations
Plugin 'nathanaelkane/vim-indent-guides'

" CoffeeScript
Plugin 'kchmck/vim-coffee-script'

" Gundo
Plugin 'sjl/gundo.vim'

" Python
Plugin 'klen/python-mode'
Plugin 'majutsushi/tagbar'

" Html
Plugin 'https://github.com/mattn/emmet-vim/'

" mgmt
Plugin 'freitass/todo.txt-vim.git'
Plugin 'sotte/presenting.vim.git'
Plugin 'jceb/vim-orgmode'

" Clojure stuff
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'luochen1990/rainbow'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" How many lines of history to remember
set history=1000
" use the clipboard even in terminal
set clipboard+=unnamed
" enable error files and error jumping
set cf
" support all three, in this order
set ffs=unix,mac,dos
" make sure it can save viminfo
set viminfo+=!
" none of these should be word dividers, so make them not be
set isk+=_,$,@,%,#,-
" show me colored syntax
syntax on
" show wrapped lines:
set sbr=> 
" Allow backspace in insert mode
set backspace=indent,eol,start
" wrap lines
set wrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" searching
" show matching brackets
set showmatch
" how many tenths of a second to blink matching brackets for
set mat=5

" do highlight searched for phrases
set hlsearch
" BUT do highlight as you type your search phrase
set incsearch

" set columns=160 " 160 cols wide
" Keep 5 lines (top/bottom) for scope
set so=5

" do blink
set visualbell
" no noises
set noerrorbells

" show whitelist
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" the status line:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" always show the status line
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#enabled = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let itermsession=$ITERM_PROFILE
set background=dark
if itermsession == "Light"
    set background=light
endif
colorscheme solarized

" rainbow parentheses
let g:rainbow_active = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autoindent
set ai
" smartindent
set si
" do c-style indenting
set cindent

" expand <CR>
let delimitMate_expand_cr = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup python
    au!
    au BufNewFile /**/retresco/**/*.py 0r ~/.vim/skeleton/rtrpython.py|norm G
    au BufNewFile /**/*.py 0r ~/.vim/skeleton/python.py|norm G
    au FileType python set textwidth=80
    au FileType python set omnifunc=pythoncomplete#Complete
    au FileType python set relativenumber
    au FileType python set number
    au FileType python nnoremap <buffer> <localleader>c I#<esc>
"    au FileType python IndentGuidesEnable

    if v:version >= 703
        au FileType python set colorcolumn=80
    endif

    " python-mode stuff
    " Switch pylint, pyflakes, pep8, mccabe code-checkers
    " Can have multiply values "pep8,pyflakes,mcccabe"
    let g:pymode_lint_checker = "pylama"
    let g:pymode_rope_complete_on_dot = 0
    let g:pymofe_rope = 0
augroup END

augroup html
    au!
    au FileType html set textwidth=0
    au FileType html set relativenumber
    au FileType html set number
    au FileType html set colorcolumn=0
    autocmd BufNewFile,BufRead *.html setlocal nowrap
augroup END

augroup htmldjango
    au!
    au FileType htmldjango set textwidth=0
    au FileType htmldjango set relativenumber
    au FileType htmldjango set number
    au FileType htmldjango set colorcolumn=0
    autocmd BufNewFile,BufRead *.html setlocal nowrap
augroup END

augroup clojure
    au!
    let g:clojure_align_multiline_strings = 1
    au FileType clojure set relativenumber
    au FileType clojure set number
augroup END

augroup otherfiletypes
    au!
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    autocmd FileType c set omnifunc=ccomplete#CompleteCpp
augroup END

augroup todotext
    au!
    autocmd BufNewFile,BufRead todo*.txt set filetype=todo
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabstops
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable
" Make folding indent sensitive
set foldmethod=indent
" Don't autofold anything (but I can still fold manually)
set foldlevel=2
" don't open folds when you search into them
"set foldopen-=search
" don't open folds when you undo stuff
set foldopen-=undo

" vim filetype settings {{{
augroup filetype_vim
    au!
    au FileType vim setlocal foldmethod=marker
augroup END
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap tr :tabprevious<CR>
nnoremap ty :tabnext<CR>
nnoremap <C-L> :nohl<CR><C-L>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>C :set background=light<CR>
nnoremap <leader>c :set background=dark<CR>

" do not jump on wrapped lines
nnoremap j gj
nnoremap k gk

" don't show these filetypes in NERDTree
set wildignore+=*/tmp/*,*.so,*.swp,*.pyc
let NERDTreeIgnore = ['\.pyc$', '\.so$', '\.swp$']

" ctrl-p
let g:ctrlp_clear_cache_on_exit = 0

nnoremap <leader>u :GundoToggle<CR>
