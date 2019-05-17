function! SplitCurrent()
    let current_word = expand("<cword>")
    normal ciw
    for current_char in split(current_word, '\zs')
        execute "normal a\'" . current_char . "\', "
    endfor
    normal "xxx"
endfunction
