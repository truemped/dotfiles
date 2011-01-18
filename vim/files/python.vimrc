" commands for python files

function! PythonKeyboardMappings()
	"
	" Keyboard shortcuts
	"
	noremap		<silent> <F5>	<Esc><Esc>:Tlist<CR>
	inoremap	<silent> <F5>	<Esc><Esc>:Tlist<CR>
	imap		<silent> <F6>   :let &number=1-&number<CR>
	map			<silent> <F6>   :let &number=1-&number<CR>
endfunction

set syntax=python
set tabstop=8
set shiftwidth=4
set softtabstop=4
set foldmethod=indent
set textwidth=79
set autoindent
set omnifunc=pythoncomplete#Complete
set number

call GeneralKeyboardMappings()
call PythonKeyboardMappings()

