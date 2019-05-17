" Set the values of the line numbers inside vim files.
"
" This script would make the numbers be both relative and absolute for the file
" while you are in it in the normal mode, but it would make it have regular
" (absolute) line numbers for any file that you are not currently on or when you
" are in insert mode.
"
" This is the best method for line numbers that I have found.

set number relativenumber

augroup NumberToggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


