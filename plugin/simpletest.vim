" @Author:      Tom Link (micathom AT gmail com?subject=[vim])
" @Website:     https://github.com/tomtom
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Last Change: 2019-04-12
" @Revision:    19
" GetLatestVimScripts: 0 0 :AutoInstall: simpletest.vim

if &cp || exists('g:loaded_simpletest')
    finish
endif
if !exists('v:errors')
    echom 'Simpletest requires a newer version of VIM that supports v:errors'
    finish
endif
let g:loaded_simpletest = 1

let s:save_cpo = &cpo
set cpo&vim


" :display: :Simpletest [NAME]
" Run test functions whose name matches /NAME#(...#)*Test_.*/ and 
" display a list of errors.
"
" If no name is give, run all test function.
"
" Test functions should use VIM's |assert_equal()| and similar functions 
" and report to v:errors.
command! -nargs=+ Simpletest call simpletest#Test(<f-args>)


let &cpo = s:save_cpo
unlet s:save_cpo
