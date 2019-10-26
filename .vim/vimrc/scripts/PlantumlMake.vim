" Language:     PlantUML
" Maintainer:   Aaron C. Meadows &lt; language name at shadowguarddev dot com&gt;
" Last Change:  19-Jun-2012
" Version:      0.1
"

if exists("g:loaded_plantuml_plugin")
    finish
endif
let g:loaded_plantuml_plugin = 1

if !exists("g:plantuml_executable_script")
        let g:plantuml_executable_script='java -jar /home/omri/.vim/bundle/vim-slumlord/plantuml.jar'
endif
let s:makecommand=g:plantuml_executable_script." %"

" define a sensible makeprg for plantuml files
autocmd Filetype plantuml let &l:makeprg=s:makecommand
