" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @Website:     https://github.com/tomtom
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Last Change: 2019-04-16
" @Revision:    35


function! simpletest#Test(...) abort "{{{3
    let l:name = a:0 >= 1 ? a:1 : ''
    let l:file_rx = a:0 >= 1 ? a:1 : l:name
    let l:rx = 'Test_'
    let v:errors = []
    exec 'runtime!' 'test/'. l:name .'.vim'
    exec 'runtime!' 'test/'. l:name .'/*.vim'
    redir => l:fns
    silent exec 'verb function /'. l:rx
    redir END
    let l:fn_line = 0
    let l:fname = ''
    let l:fcnt = 0
    for l:fn in split(l:fns, '\n')
        let l:fn_line = !l:fn_line
        if l:fn_line
            let l:fname = matchstr(l:fn, '^function \zs[^(]\+')
        elseif l:fn =~# '\<'. l:file_rx .'\>'
            let l:fcnt += 1
            call call(l:fname, [])
        endif
    endfor
    echohl WarningMsg
    echom 'Simpletest' string(l:name) .':' len(v:errors) 'errors in' l:fcnt 'test functions'
    for l:err in v:errors
        echohl l:err
    endfor
    echohl NONE
endf

