" Author: w0rp <devw0rp@gmail.com>
" Description: Fixing Python imports with isort.

function! ale#fixers#isort#Fix(buffer) abort
    let l:executable = ale#handlers#python#GetExecutable(a:buffer, 'isort')
    if empty(l:executable)
        return 0
    endif

    let l:config = ale#path#FindNearestFile(a:buffer, '.isort.cfg')
    let l:config_options = !empty(l:config)
    \   ? ' --settings-path ' . ale#Escape(l:config)
    \   : ''

    return {
    \   'command': ale#Escape(l:executable) . l:config_options . ' -',
    \}
endfunction
