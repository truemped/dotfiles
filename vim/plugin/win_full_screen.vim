" File: win_full_screen.vim
" Author: Nickolay Golubev
" Email: golubev.nikolay@gmail.com
"
" Script for maximize current window and restore others windows sizes after
" Usage:
"   Command :WinFullScreen to maximize current window
"   Command :WinFullScreen again (or move to another window or tab) restore
"   windows sizes
"   Map :WinFullScreen for any key you like and enjoy vim's windows

if exists('win_full_screen_plugin')
    finish
endif

let win_full_screen_plugin = 1

let s:windows_sizes = []
let s:full_screen = 0

function! s:SaveWindowsSize()
    let s:windows_sizes = []

    let l:win_count = winnr('$')

    let s:minwinwidth = &winminwidth
    let s:minwinheight = &winminheight
    let l:win_number = 1
    while l:win_number <= l:win_count
	let l:win_width = winwidth(l:win_number)
	let l:win_height = winheight(l:win_number)

	let l:win_number = l:win_number + 1
	call add(s:windows_sizes, [l:win_width, l:win_height])
    endwhile
endfunction

function! s:RestoreWindowsSize()
    let l:win_count = len(s:windows_sizes)
    let l:curr_window = winnr()
    
    let l:win_number = 0
    while l:win_number < l:win_count
	exec l:win_number+1.'wincmd w'   
	let l:width = s:windows_sizes[l:win_number][0]
	let l:height = s:windows_sizes[l:win_number][1]
	exec 'vertical resize '.l:width
	exec 'resize '.l:height

	let l:win_number = l:win_number + 1
    endwhile

    exec l:curr_window.'wincmd w'   
endfunction

function! s:EnterFullScreen()
    let s:full_screen = 1
    call s:SaveWindowsSize()

    exec 'resize 1000'
    exec 'vertical resize 1000'

    augroup fullScreenToggleAU
	au!
	au WinLeave *.* call s:LeaveFullScreen()
    augroup END
endfunction

function! s:LeaveFullScreen()
    let s:full_screen = 0
    call s:RestoreWindowsSize()

    augroup fullScreenToggleAU
	au!
    augroup END
endfunction

function! <SID>ToggleFullScreen()
    if s:full_screen
	call s:LeaveFullScreen()
	return
    endif

    call s:EnterFullScreen()
endfunction

command! WinFullScreen call <SID>ToggleFullScreen()
