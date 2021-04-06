command! -buffer Flake8 call flake8#Flake8()
command! -buffer Fmt call Fmt()
command! -buffer Test call Test()
command! -buffer Doctest call Doctest()
cnoreabbrev flake Flake8
cnoreabbrev flake8 Flake8
cnoreabbrev fmt Fmt
cnoreabbrev test Test
cnoreabbrev doctest Doctest

function Test()
  :Pytest file
endfunction

function Doctest()
  :!pytest --doctest-modules file
endfunction

function Fmt()
  Black
  Isort
endfunction

let g:quickrun_config.python = {
			\ 'command': 'python3',
			\ }

let g:python_highlight_space_errors = 0

let g:vim_isort_config_overrides = {
  \ 'force_single_line': 1,
  \}
