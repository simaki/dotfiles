set tabstop=4
set shiftwidth=4
set expandtab

nnoremap <leader>lt :VimtexTocOpen<CR>
autocmd BufWritePost,FileWritePost *.tex :QuickRun
" command! -buffer View :VimtexView<CR>
" command! -buffer View :VimtexView<CR>
" command! -buffer Toc :VimtexTocOpen<CR>
" cnoreabbrev view View
" cnoreabbrev toc Toc

" autocmd BufWritePost,FileWritePost *.tex :<Plug>(quickrun)<CR>

" autocmd VimLeavePre *.tex :VimtexClean
" autocmd VimLeavePre *.tex :!rm *.tex.bak
" autocmd VimLeavePre *.tex :!rm *Notes.bib
" autocmd VimLeavePre *.tex :!rm pdflatex*.fls

let g:tex_flavor = 'latex'

let g:quickrun_config.tex = {
			\ 'command': 'tectonic',
			\ 'outputter': 'error',
			\ 'outputter/error/success': 'null',
			\ 'outputter/error/error': 'quickfix',
			\ }

let g:vimtex_compiler_method = 'tectonic'
" let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:vimtex_motion_matchparen = 0

nnoremap e o\begin{align*}<CR><CR>\end{align*}<Up><TAB>
nnoremap E o\begin{align}<CR><CR>\end{align}<Up><TAB>

inoremap \\f \frac{}{}<LEFT><LEFT><LEFT>

inoremap \\a \alpha
inoremap \\b \beta
inoremap \\c \chi
inoremap \\d \delta
inoremap \\e \epsilon
inoremap \\g \gamma
inoremap \\k \kappa
inoremap \\l \lambda
inoremap \\m \mu
inoremap \\n \nu
inoremap \\o \omega
inoremap \\r \rho
inoremap \\s \sigma
inoremap \\t \tau
inoremap \\u \upsilon
inoremap \\x \xi
inoremap \\y \eta
inoremap \\z \zeta
inoremap \\D \Delta
inoremap \\G \Gamma
inoremap \\L \Lambda
inoremap \\O \Omega
inoremap \\S \Sigma
inoremap \\X \Xi
