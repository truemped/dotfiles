
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Latex Suite 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
" let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
" let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'
" let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
" let g:Tex_FormatDependency_ps = 'dvi,ps'
" let g:Tex_MultipleCompileFormats = 'dvi'
" let g:Tex_ViewRule_dvi = 'xdvi'
let g:Tex_ViewRule_ps = 'ggv'
let g:Tex_ViewRule_pdf = 'xpdf'
let g:Tex_ViewRule_pdflatex = 'xpdf'


set filetype=tex
set textwidth=120
set wrap
set nonumber
call GeneralKeyboardMappings()
