
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Viki 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" this is in utf-8
let g:vikiHomePage = "/Volumes/secret/PersonalWiki/wiki.viki"
let g:vikiLowerCharacters = "a-zäöüßáàéèíìóòçñ"
let g:vikiUpperCharacters = "A-ZÄÖÜ"
let g:vikiUseParentSuffix = 1
let g:vikiTextStyles = 1
let g:vikiNameSuffix = ".viki"

set filetype=viki
set tw=110

" set default keyboard mappings
call GeneralKeyboardMappings()
