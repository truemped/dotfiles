
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" How many lines of history to remember
set history=1000 
" enable error files and error jumping
set cf

"set clipboard+=unnamed " turns out I do like is sharing windows clipboard
" support all three, in this order
set ffs=mac,unix,dos
" load filetype plugins
filetype plugin on
" make sure it can save viminfo
set viminfo+=!
" none of these should be word dividers, so make them not be
set isk+=_,$,@,%,#,-
" show me colored syntax
syntax on
" Needed for the WinManager plugin 
filetype on
" needed for the Project plugin
set nocompatible
" store swap file in .backup/ or /tmp
set dir=./.backup,.,/tmp
set bdir-=./.backup,.,/tmp

" show wrapped lines:
set sbr=> 

" no windows alt key; use menu if wanted
set wak=no

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" searching
" show matching brackets
set showmatch
" how many tenths of a second to blink matching brackets for
set mat=5
" do not highlight searched for phrases
set nohlsearch
" BUT do highlight as you type your search phrase
set incsearch

set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$ " what to show when I hit :set list
" set lines=80 " 80 lines tall
" set columns=160 " 160 cols wide
" Keep 5 lines (top/bottom) for scope
set so=5
" don't blink
set novisualbell
" no noises
set noerrorbells

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" the status line:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" always show the status line
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $HOME/.vim/colors/hhdcyan.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" menu in console
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"source $VIMRUNTIME/menu.vim
"set wildmenu
"set cpo-=<
"set wcm=<C-Z>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabstops
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set softtabstop=4
set tabstop=4
set shiftwidth=4
" real tabs please!
set expandtab
" use tabs at the start of a line, spaces elsewhere
set smarttab

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
" Options for Vim 7.0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if version >= 700
	"let loaded_matchparen = 1
	" turn spelling on by default
	"set spell
	" change to german
	set spelllang=de_20
	"
	set spellfile=~/.vim/de.add
	" they were using white on white
	" highlight PmenuSel ctermfg=black ctermbg=lightgray
	" limit it to just the top 10 items
	set sps=best,5
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" in general files:
" <F2>       Toggle spell check
" <F3>       Previous Tab
" <F4>       Next Tab
function! GeneralKeyboardMappings()
	map			<F2> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>
	imap        <silent> <F3>   :tabprevious<CR>
	map         <silent> <F3>   :tabprevious<CR>
	imap        <silent> <F4>   :tabnext<CR>
	map         <silent> <F4>   :tabnext<CR>
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TSkeleton 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePre * call TSkeletonIncreaseRevisionNumber()
let g:tskelUserName = 'Daniel Truemper'
let g:tskelUserEmail = 'truemped@googlemail.com'
let g:tskelUserWWW = 'http://software.hence22.org/blog'
let g:tskelLicense = ''
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tlist extensions:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:tlist_tex_settings='latex;s:section;c:chapter;l:label;r:ref'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" markdown files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup mkd
	au!
	au BufRead,BufNewFile,BufEnter *.mdwn so ~/.vim/files/markdown.vimrc
	au BufRead,BufNewFile,BufEnter *.mkd so ~/.vim/files/markdown.vimrc
	au BufRead,BufNewFile,BufEnter /Users/danieltruemper/Documents/Zukunft/qns/wiki/* so ~/.vim/files/markdown.vimrc
	au BufRead,BufNewFile,BufEnter /Users/danieltruemper/Documents/Wiki/* so ~/.vim/files/markdown.vimrc
	call GeneralKeyboardMappings()
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mail handling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup mail

	autocmd!
	autocmd FileType mail set textwidth=78 wrap nonumber

	" autoindent
	autocmd FileType mail set noai
	" smartindent
	autocmd FileType mail set nosi
	" do c-style indenting
	autocmd FileType mail set nocindent

augroup END 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" viki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup viki
	au!
	au BufRead,BufNewFile,BufEnter *.viki so ~/.vim/files/viki.vimrc
	au BufRead,BufNewFile,BufEnter /Volumes/secret/PersonalWiki/* so ~/.vim/files/viki.vimrc
	au BufRead,BufNewFile,BufEnter /Volumes/secret/PersonalWiki/* so ~/.vim/files/viki.vimrc
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" latex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup tex
	au!
	au BufRead,BufNewFile,BufEnter *.tex so ~/.vim/files/latex.vimrc
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup PYTHON
	au!
	au BufRead,BufNewFile,BufEnter *.py source ~/.vim/files/python.vimrc
	au FileType python so ~/.vim/files/python.vimrc
	au BufNewFile *.py TSkeletonSetup python.py
augroup END

autocmd BufRead,BufNewFile,BufEnter *.R set filetype=r

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#CompleteCpp

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" XML editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap		,,,				<esc>bdwa<<esc>pa><cr></<esc>pa><esc>kA

