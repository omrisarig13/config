" The purpose of this file is to load all the little scripts that I wrote (or
" copied) into vim. Each script would have its single purpose, and it would do
" just that.
" Each couple of lines with code with a single purpose would be exported into
" its own script, so it would be easier to change vim config.
execute 'source ' . expand("<sfile>:p:h") . '/scripts/a.vim'
execute 'source ' . expand("<sfile>:p:h") . '/scripts/set_lines.vim'
execute 'source ' . expand("<sfile>:p:h") . '/scripts/grep_operator.vim'
execute 'source ' . expand("<sfile>:p:h") . '/scripts/help_operator.vim'
execute 'source ' . expand("<sfile>:p:h") . '/scripts/next_last_operations.vim'
