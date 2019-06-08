Created by
==========

Andreas Politz

Script type
===========

utility

Description
===========

*ShowMarks*

Give a visual aid to navigate marks, by displaying them as signs
(obviously needs the +signs feature).

Commands
--------

    :DoShowMarks
       show marks for current buffer
    :DoShowMarks!
       show marks for all buffers
    :NoShowMarks
       disable it for current buffer
    :NoShowMarks!
       disable it for all buffers

    :[count]ShowMarksOnce
       Display marks for [count] Cursorhold
       events. Mostly for mapping it like :
       nnoremap ` :ShowMarksOnce<cr>`

    :[count]PreviewMarks
       Display marks of current buffer in pvw.
       Like ':marks', but at the top of the window ;-).
       [count] is the same as above.

Variables
---------

    let g:showmarks_marks = "abcdef...."
       the marks you want to have displayed.
    hlShowMarks
       the highlight color
    let g:showmarks_default_load = 0
       1 to load the showmarks by default, 0 otherwise.
       By default, it is 0.
    let g:showmarks_load_keymap = 0
       1 to load the showmarks keymaps by default, 0 otherwise.
       By default, it is 0.
    let g:showmarks_do_keymap = '<f5>'
       The keymap to use for the DoShowMarks command.
       It would be used only if the flag of g:showmarks_load_keymap is on.
       To disable only this keymap, set it it ''
       By default, it is <f5>
    let g:showmarks_no_keymap = '<f6>'
       The keymap to use for the NoShowMarks command.
       It would be used only if the flag of g:showmarks_load_keymap is on.
       To disable only this keymap, set it it ''
       By default, it is <f6>
    let g:showmarks_do_all_keymap = '<f7>'
       The keymap to use for the DoShowMarks! command.
       It would be used only if the flag of g:showmarks_load_keymap is on.
       To disable only this keymap, set it it ''
       By default, it is <f7>
    let g:showmarks_no_all_keymap = '<f8>'
       The keymap to use for the NoShowMarks! command.
       It would be used only if the flag of g:showmarks_load_keymap is on.
       To disable only this keymap, set it it ''
       By default, it is <f8>

I suggest you lower the value of 'updatetime'.
