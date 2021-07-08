call plug#begin('~/.vim/plugged')
Plug 'Shougo/denite.nvim'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'rakr/vim-one'
Plug 'daylerees/colour-schemes'
Plug 'alfredodeza/pytest.vim'
Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoUpdateBinaries'}
Plug 'fisadev/vim-isort', {'for': 'python', 'on': 'Isort'}
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'psf/black', {'for': 'python', 'on': 'Black'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'junegunn/seoul256.vim'
Plug 'mhartington/oceanic-next'
Plug 'rakr/vim-one'
call plug#end()

" --- color ---

colorscheme one
set background=light
au ColorScheme * highlight Normal ctermbg=None
" au ColorScheme * highlight Normal ctermbg=231

" --- set ---

set cindent
set completeopt-=preview
set display=lastline
set expandtab
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set noshowmode
set noswapfile
set scrolloff=20
set shiftwidth=2
set shm+=I " Disable Vim's start screen
set smartcase
set synmaxcol=400
set tabstop=2
set virtualedit=onemore
set wrapscan

" --- map ---

inoremap jk <Esc>
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <CR> o<ESC>
nnoremap <ESC><ESC> :noh<CR><ESC>
nnoremap <SPACE> i<SPACE><ESC>l
nnoremap <TAB> i<TAB><ESC>
nnoremap H 0
nnoremap K i<CR><ESC>
nnoremap L $
nnoremap N Nzz
nnoremap Y y$
nnoremap n nzz
vnoremap Y y$

command! -buffer W :w
command! -buffer Wq :wq
command! -buffer Wqa :wqa
command! -buffer Pbcopy silent !cat % | pbcopy
cnoreabbrev pbcopy Pbcopy

" --- lightline ---

let g:lightline = {}
" let g:lightline.colorscheme = 'seoul256' dark only
let g:lightline.colorscheme = 'one'
let g:lightline.active = {
  \ 	'left': [['mode', 'paste'], ['dirfile', 'readonly', 'modified']],
  \ 	'right': [['lineinfo'], ['percent']]
  \ }
let g:lightline.component_function = {
  \ 'dirfile': 'LightLineDirFile',
  \ 'cocstatus': 'coc#status'
  \ }
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

function! LightLineDirFile()
  " Returns `<working directory>/<filename>`.
  if expand('%:t') ==# ''
    return ''
  endif

  let path = split(expand('%:p'), '/')
  if len(path) < 2
    let dirfile = path[0]
  else
    let dirfile = path[-2] . '/' . path[-1]
  endif
  return dirfile
endfunction

" --- DENITE ---

nnoremap <leader>df :Denite file file/rec<CR>

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
	nnoremap <silent><buffer><expr> <CR>
				\ denite#do_map('do_action')
	nnoremap <silent><buffer><expr> v
				\ denite#do_map('do_action', 'vsplit')
	nnoremap <silent><buffer><expr> <RIGHT>
				\ denite#do_map('do_action', 'narrow')
	nnoremap <silent><buffer><expr> <LEFT>
				\ denite#do_map('move_up_path')
	nnoremap <silent><buffer><expr> cd
				\ denite#do_map('do_action', 'cd')
	nnoremap <silent><buffer><expr> q
				\ denite#do_map('quit')
endfunction

let s:matcher = ['matcher/fuzzy', 'matcher/ignore_globs']
let s:sorter = ['sorter/word']
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs', ['.git/', '__pycache__/'])
call denite#custom#kind('file', 'default_action', 'vsplit')
call denite#custom#source('directory_rec', 'matchers', s:matcher)
call denite#custom#source('directory_rec', 'sorters', s:sorter)
call denite#custom#source('file', 'matchers', s:matcher)
call denite#custom#source('file', 'sorters', s:sorter)
call denite#custom#source('file/rec', 'matchers', s:matcher)
call denite#custom#source('file/rec', 'sorters', s:sorter)
call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#option('default', {
  \ 'smartcase': 'true',
  \ 'split': 'floating',
  \ 'winheight': &lines / 2,
  \ 'winwidth': &columns / 2,
  \ 'winrow': &lines / 4,
  \ 'wincol': &columns / 4,
  \ })

" --- QUICKRUN ---

silent! map <silent><Leader>r <Plug>(quickrun)
silent! map <silent><Leader>q :<C-u>bw! quickrun<CR>
silent! map <silent><Leader>Q :call quickrun#session#sweep()<CR>:<C-u>bw! quickrun<CR>

let g:quickrun_config = {
	\ 'hook/time/format': "\n--- Runtime %.2f sec ---",
	\ 'outputter/buffer/running_mark': "\n--- Running " . expand("%") . ' ---',
	\ 'outputter/buffer/close_on_empty': 1,
	\ 'runner': 'vimproc',
\ }

" --- MISC ---

augroup HilightsForce
  autocmd!
  autocmd WinEnter,BufRead,BufNew,Syntax * :silent! call matchadd('Todo', '\(TODO\|NOTE\|INFO\|XXX\|TEMP|FIXME|DEBUG\)')
  autocmd WinEnter,BufRead,BufNew,Syntax * highlight link Todo SpecialComment
augroup END

syntax enable
let s:syntax_bg = ['#fafafa', '255']
let g:better_whitespace_enabled = 0
let g:strip_whitespace_confirm = 0
let g:strip_whitespace_on_save = 1
let g:strip_whitelines_at_eof = 1

" --- coc TODO remove unnecessary configs ---

" TextEdit might fail if hidden is not set.
" set hidden

" Some servers have issues with backup files, see #649.
" set nobackup
" set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" if has("nvim-0.5.0") || has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
