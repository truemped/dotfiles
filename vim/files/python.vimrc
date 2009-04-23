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
set tabstop=4
set shiftwidth=4
set foldmethod=indent
set textwidth=110
set ai
set omnifunc=pythoncomplete#Complete

call GeneralKeyboardMappings()
call PythonKeyboardMappings()

