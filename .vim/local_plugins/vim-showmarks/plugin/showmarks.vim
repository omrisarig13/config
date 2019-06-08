" Display marks in the signs column
" Maintainer:	A. Politz <cbyvgmn@su-gevre.qr>
" Last change: 2008-02-06
" v0.1
"
"ShowMarks
"
"Give a visual aid to navigate marks, by displaying them as signs
"(obviously needs the +signs feature).
"
"commands
"--------
"
":DoShowMarks
"  show marks for current buffer
":DoShowMarks!
"  show marks for all buffers
":NoShowMarks
"  disable it for current buffer
":NoShowMarks!
"  disable it for all buffers
"
":[count]ShowMarksOnce 
"  Display marks for [count] Cursorhold 
"  events. Mostly for mapping it like :
"  nnoremap ` :ShowMarksOnce<cr>`
"
":[count]PreviewMarks
"  Display marks of current buffer in pvw.
"  Like ':marks', but at the top of the window ;-).
"  [count] is the same sa above.
"
"variables
"--------
"
"let g:showmarks_marks = "abcdef...."
"  the marks you want to have displayed.
"hlShowMarks
"  the highlight color
"let g:showmarks_default_load = 0
"   1 to load the showmarks by default, 0 otherwise.
"   By default, it is 0.
"let g:showmarks_load_keymap = 0
"   1 to load the showmarks keymaps by default, 0 otherwise.
"   By default, it is 0.
"let g:showmarks_do_keymap = '<f5>'
"   The keymap to use for the DoShowMarks command.
"   It would be used only if the flag of g:showmarks_load_keymap is on.
"   To disable only this keymap, set it it ''
"   By default, it is <f5>
"let g:showmarks_no_keymap = '<f6>'
"   The keymap to use for the NoShowMarks command.
"   It would be used only if the flag of g:showmarks_load_keymap is on.
"   To disable only this keymap, set it it ''
"   By default, it is <f6>
"let g:showmarks_do_all_keymap = '<f7>'
"   The keymap to use for the DoShowMarks! command.
"   It would be used only if the flag of g:showmarks_load_keymap is on.
"   To disable only this keymap, set it it ''
"   By default, it is <f7>
"let g:showmarks_no_all_keymap = '<f8>'
"   The keymap to use for the NoShowMarks! command.
"   It would be used only if the flag of g:showmarks_load_keymap is on.
"   To disable only this keymap, set it it ''
"   By default, it is <f8>

"I suggest to lower the value of 'updatetime'.

if exists('loaded_showmarks')
  finish
endif

let s:cpo=&cpo
set cpo&vim

let loaded_showmarks = 1

if version < 700
  com DoShowMarks echohl Error | echo "Sorry, you need vim7 for this plugin (Showmarks)." | echohl None | delc DoShowMarks
  finish
endif

if !has('signs')
  com DoShowMarks 
	\echohl Error 
	\| echo "Sorry, your version does not support signs (Showmarks). You may still use the PreviewMarks command." 
	\| echohl None | delc DoShowMarks
else
  com  -bar -bang DoShowMarks 
        \if <bang>0 | call showmarks#ShowMarks('global,enable') | else | call showmarks#ShowMarks('enable,local') | endif
  com  -bar -bang NoShowMarks 
        \if <bang>0 | call showmarks#ShowMarks('global') | else | call showmarks#ShowMarks('') | endif
  com   -bar -bang -count=1 ShowMarksOnce call showmarks#ShowMarks('once',<count>,<bang>0)
endif

com!  -bar -bang -count=0 PreviewMarks call showmarks#ShowMarks('preview',<count>)

let &cpo=s:cpo
unlet s:cpo

" Set the global variables.
if !exists('g:showmarks_default_load') | let g:showmarks_default_load = 0 | en
if !exists('g:showmarks_load_keymap') | let g:showmarks_load_keymap = 0 | en
if !exists('g:showmarks_do_keymap') | let g:showmarks_do_keymap = '<f5>' | en
if !exists('g:showmarks_no_keymap') | let g:showmarks_no_keymap = '<f6>' | en
if !exists('g:showmarks_do_all_keymap') |let g:showmarks_do_all_keymap = '<f7>' | en
if !exists('g:showmarks_no_all_keymap') | let g:showmarks_no_all_keymap = '<f8>' | en

" Run the functionality according to those global values.
if g:showmarks_default_load
    DoShowMarks!
endif

if g:showmarks_load_keymap
    if g:showmarks_do_keymap !=# ''
        execute "nnoremap " . g:showmarks_do_keymap . " :DoShowMarks<cr>"
    endif
    if g:showmarks_no_keymap !=# ''
        execute "nnoremap " . g:showmarks_no_keymap . " :NoShowMarks<cr>"
    endif
    if g:showmarks_do_all_keymap !=# ''
        execute "nnoremap " . g:showmarks_do_all_keymap . " :DoShowMarks!<cr>"
    endif
    if g:showmarks_no_all_keymap !=# ''
        execute "nnoremap " . g:showmarks_no_all_keymap . " :NoShowMarks!<cr>"
    endif
endif
