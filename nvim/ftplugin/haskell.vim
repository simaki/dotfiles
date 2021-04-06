let g:quickrun_config['haskell'] = {'type': 'haskell/stack_runghc'}
let g:quickrun_config['haskell/stack_runghc'] = {
      \ 'command'           : 'stack',
      \ 'exec'              : '%c runghc %s %a',
      \ 'tempfile'          : '%{tempname()}.hs',
      \ 'hook/eval/template': 'main = print \$ %s',
      \ }

let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_backpack = 1

let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
