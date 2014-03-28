" be iMproved
set nocompatible

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'majutsushi/tagbar'
Bundle 'kchmck/vim-coffee-script'
"Bundle 'ciaranm/inkpot'
Bundle 'altercation/vim-colors-solarized'
"Bundle 'kevinw/pyflakes-vim'
Bundle 'klen/python-mode'
Bundle 'hsitz/VimOrganizer'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"Bundle 'rails.vim'
" non github repos
Bundle 'https://github.com/fholgado/minibufexpl.vim.git'
" Bundle 'https://github.com/tony-landis/snipmate.vim.git'
" Bundle 'git://git.wincent.com/command-t.git'
Bundle 'https://github.com/kien/ctrlp.vim.git'
Bundle 'https://github.com/scrooloose/nerdtree.git'
Bundle 'https://github.com/mattn/emmet-vim/'
Bundle 'freitass/todo.txt-vim.git'
" ...

filetype plugin indent on     " required!
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
"
" set columns=160 " 160 cols wide
" Keep 5 lines (top/bottom) for scope
set so=5
" do blink
set visualbell
" no noises
set noerrorbells

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" the status line:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" always show the status line
set laststatus=2
set statusline=%F%m%r%h%w\ [F=%{&ff},T=%Y]\ [ASCII=\%03.3b]\ [POS=%03l,%03v,%p%%]\ [LEN=%L]\ [%{fugitive#statusline()}]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme slate

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autoindent
set ai
" smartindent
set si
" do c-style indenting
set cindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup python
    au!
    au BufNewFile /**/retresco/**/*.py 0r ~/.vim/skeleton/rtrpython.py|norm G
    au BufNewFile /**/*.py 0r ~/.vim/skeleton/python.py|norm G
    au FileType python set textwidth=80
    au FileType python set omnifunc=pythoncomplete#Complete
    au FileType python set number
    au FileType python nnoremap <buffer> <localleader>c I#<esc>

    if v:version >= 703
        au FileType python set colorcolumn=80
    endif
augroup END

augroup html
    au!
    au FileType HTML set textwidth=0
    au FileType HTML set number
    au FileType HTML set colorcolumn=0
    autocmd BufNewFile,BufRead *.html setlocal nowrap
augroup END

augroup htmldjango
    au!
    au FileType HTMLDJANGO set textwidth=0
    au FileType HTMLDJANGO set number
    au FileType HTMLDJANGO set colorcolumn=0
    autocmd BufNewFile,BufRead *.html setlocal nowrap
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

" don't show these filetypes in NERDTree
set wildignore+=*/tmp/*,*.so,*.swp,*.pyc
let NERDTreeIgnore = ['\.pyc$', '\.so$', '\.swp$']

" python-mode stuff
" Switch pylint, pyflakes, pep8, mccabe code-checkers
" Can have multiply values "pep8,pyflakes,mcccabe"
let g:pymode_lint_checker = "pylama"
let g:pymode_rope_complete_on_dot = 0
let g:pymofe_rope = 0
