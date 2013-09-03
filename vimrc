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
Bundle 'kevinw/pyflakes-vim'
Bundle 'klen/python-mode'
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
Bundle 'https://github.com/mattn/zencoding-vim/'
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
    au FileType python set syntax=python
    au FileType python set textwidth=79
    au FileType python set omnifunc=pythoncomplete#Complete
    au FileType python set number
    au FileType python nnoremap <buffer> <localleader>c I#<esc>

    if v:version >= 703
        au FileType python set colorcolumn=80
    endif
augroup END

augroup python-mode
    " python-mode stuff
    let g:pymode_lint_write = 0
    " Load show documentation plugin
    let g:pymode_doc = 1
    " Key for show python documentation
    let g:pymode_doc_key = 'K'
    " Switch pylint, pyflakes, pep8, mccabe code-checkers
    " Can have multiply values "pep8,pyflakes,mcccabe"
    let g:pymode_lint_checker = "pylint,pyflakes"
    " ,pep8,mccabe"
augroup END

augroup html
    au!
    au FileType HTML set textwidth=0
    au FileType HTML set number
    au FileType HTML set colorcolumn=0
augroup END

augroup htmldjango
    au!
    au FileType HTMLDJANGO set textwidth=0
    au FileType HTMLDJANGO set number
    au FileType HTMLDJANGO set colorcolumn=0
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
nnoremap <leader>pd aimport pdb; pdb.set_trace()<esc>
nnoremap <leader>ipd aimport ipdb; ipdb.set_trace()<esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" some useful autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup useful
    au!
    autocmd BufNewFile,BufRead *.html setlocal nowrap
augroup END

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
