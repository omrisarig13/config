" A that holds some functions use to format C code in my specific writing style.

function! g:c_format_actions#update_error_codes_with_function_name()
    " The function assumes that the cursor is positioned in the comment line
    " with the function name before the function.

    " Get the name of the function in upper case.
    let current_function_name = toupper(substitute(getline("."), "\\v.*FUNCTION: (\\w+).*", "\\1", ""))

    " Save the range of the function.
    let function_start = line('.')
    let function_end = search("^}")

    " Run the replace for the function.
    execute l:function_start . "," . l:function_end . "substitute/FUNCTION_NAME/" . l:current_function_name . "/ge"

    " Restore the cursor to its previous line.
    call cursor(l:function_start, 1)
endfunction

function! g:c_format_actions#uppercase_error_codes()
    " Find all the error codes
    let error_codes = []
    %substitute/\w\+_ERRORS__\w\+/\=len(add(l:error_codes, toupper(submatch(0)))) ? submatch(0) : ''/gne

    " Make all the error codes uppercase
    for current_error_code in l:error_codes
        execute "%substitute/\\c". l:current_error_code . "/" . l:current_error_code . "/ge"
    endfor
endfunction

function! g:c_format_actions#save_error_codes()
    " Save the original position.
    mark M

    " Find all the error codes
    let error_codes = []
    %substitute/\w\+_ERRORS__\w\+/\=len(add(l:error_codes, submatch(0) . ',')) ? submatch(0) : ''/gne

    " Move to the wanted location, according to the convention of error format
    " mark.
    normal 'E

    " Delete the previous error codes.
    normal jd}k

    " Paste the current error codes and fix the indentation in the file.
    put =l:error_codes
    normal ==

    " Restore the original position.
    normal `M
    delmark M
endfunction

function! g:c_format_actions#handle_error_codes()
    %global/FUNCTION: /call c_format_actions#update_error_codes_with_function_name()
    call c_format_actions#uppercase_error_codes()
    call c_format_actions#save_error_codes()
endfunction
command! HandleErrorCodes silent call c_format_actions#handle_error_codes()
