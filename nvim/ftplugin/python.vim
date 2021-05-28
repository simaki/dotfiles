" :fmt --- format current file
" :Format --- format current file

command! -buffer Fmt call _Fmt()
command! -buffer Test :Pytest file
command! -buffer Doctest :!pytest --doctest-modules file
" :fmt formats the current buffer
cnoreabbrev fmt Fmt
" :test tests the current buffer
cnoreabbrev test Test
" :doctest doc-tests the current buffer
cnoreabbrev doctest Doctest

function Test()
endfunction

function Doctest()
endfunction

function _Fmt()
  Black
  Isort
endfunction

let g:quickrun_config.python = {'command': 'python3'}
let g:python_highlight_space_errors = 0
let g:vim_isort_config_overrides = {'force_single_line': 1}
