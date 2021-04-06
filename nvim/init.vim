let g:polyglot_disabled = ['ftdetect']
call plug#begin('~/.vim/plugged')
Plug 'acarapetis/vim-colors-github'
Plug 'alfredodeza/pytest.vim'
Plug 'aperezdc/vim-template'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'fatih/vim-go',                {'for': 'go', 'do': ':GoUpdateBinaries'}
Plug 'fisadev/vim-isort',           {'for': 'python', 'on': 'Isort'}
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'nixprime/cpsm'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nvie/vim-flake8', 	        {'for': 'python', 'on': 'Flake8'}
Plug 'psf/black', 				    {'for': 'python', 'on': 'Black'}
Plug 'rhysd/vim-clang-format'
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'sheerun/vim-polyglot',        {'on': []}
Plug 'Shougo/denite.nvim',
Plug 'Shougo/deoplete.nvim',        {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/vimproc.vim',          {'do': 'make'}
Plug 'thinca/vim-quickrun',         {'on': 'QuickRun'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
call plug#end()

function! s:load_plug(timer)
	call plug#load('vim-polyglot')
endfunction
call timer_start(100, function("s:load_plug"))

nnoremap H 0
nnoremap L $
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap Y y$
nnoremap K i<CR><ESC>
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap <CR> o<ESC>
nnoremap <TAB> i<TAB><ESC>
nnoremap <SPACE> i<SPACE><ESC>l
nnoremap <ESC><ESC> :noh<CR><ESC>
inoremap jk <Esc>
vnoremap Y y$

set completeopt-=preview
command! -buffer W :w
command! -buffer Wq :wq

colorscheme github

set noshowmode
set laststatus=2
set display=lastline
set scrolloff=20
set virtualedit=onemore
set background=light

let g:lightline = {}
let g:lightline = {'colorscheme': 'one'}
let g:lightline.active = {
  \ 	'left': [
  \			['mode', 'paste'],
  \   	['branch', 'readonly', 'dirfile', 'modified'],
  \   	['quickrun']
  \ 	],
  \ 	'right': [['lineinfo'], ['percent']]
  \ }
let g:lightline.component_function = {
  \ 	'dirfile': 'LightLineParentDir',
  \ 	'branch': 'fugitive#head',
  \ }

function! LightLineParentDir()
  if expand('%:t') ==# ''
    let filename = ''
  else
    let dirfiles = split(expand('%:p'), '/')
    if len(dirfiles) < 2
      let filename = dirfiles[0]
    else
      let filename = dirfiles[-2] . '/' . dirfiles[-1]
    endif
  endif
  return filename
endfunction

" --- DENITE ---

nnoremap <leader>df :Denite file file/rec<CR>
nnoremap <leader>db :Denite line<CR>

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
	nnoremap <silent><buffer><expr> <CR>
				\ denite#do_map('do_action')
	nnoremap <silent><buffer><expr> i
				\ denite#do_map('open_filter_buffer')
	nnoremap <silent><buffer><expr> v
				\ denite#do_map('do_action', 'vsplit')
	nnoremap <silent><buffer><expr> d
				\ denite#do_map('do_action', 'delete')
	nnoremap <silent><buffer><expr> p
				\ denite#do_map('do_action', 'preview')
	nnoremap <silent><buffer><expr> <RIGHT>
				\ denite#do_map('do_action', 'narrow')
	nnoremap <silent><buffer><expr> <LEFT>
				\ denite#do_map('move_up_path')
	nnoremap <silent><buffer><expr> cd
				\ denite#do_map('do_action', 'cd')
	nnoremap <silent><buffer><expr> <Space>
				\ denite#do_map('toggle_select').'j'
	nnoremap <silent><buffer><expr> q
				\ denite#do_map('quit')
	nnoremap <silent><buffer><expr> o
				\ denite#do_map('quick_move')
endfunction

let s:matcher_cpsm = ['matcher/cpsm', 'matcher/ignore_globs']
let s:sorter_word = ['sorter/word']

call denite#custom#kind('file', 'default_action', 'vsplit')
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs', ['.git/', '__pycache__/'])
call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#source('file', 'matchers', s:matcher_cpsm)
call denite#custom#source('directory_rec', 'matchers', s:matcher_cpsm)
call denite#custom#source('file/rec', 'matchers', s:matcher_cpsm)
call denite#custom#source('file', 'sorters', s:sorter_word)
call denite#custom#source('directory_rec', 'sorters', s:sorter_word)
call denite#custom#source('file/rec', 'sorters', s:sorter_word)
call denite#custom#option('default', {
  \ 'smartcase': 'true',
  \ 'split': 'floating',
  \ 'winheight': &lines / 2,
  \ 'winwidth': &columns / 2,
  \ 'winrow': &lines / 4,
  \ 'wincol': &columns / 4,
  \ })

" --- QUICKRUN ---

"	QuickRun is loaded on-demand when :QuickRun is called.
"	Since the map \r -> :QuickRun is defined in QuickRun itself,
"	We have to define this map here
" cf: https://github.com/thinca/vim-quickrun/blob/master/plugin/quickrun.vim
map <unique> <Leader>r :QuickRun<CR>
nnoremap <silent><Leader>q :<C-u>bw! quickrun<CR>
nnoremap <silent><Leader>Q :call quickrun#sweep_sessions()<CR>:<C-u>bw! quickrun<CR>

function! QuickRunRunningMark()
	return "\n--- Running " . expand("%") . ' ---'
endfunction

let g:quickrun_config = {}
let g:quickrun_config._ = {
	\ 'hook/time/enable': 1,
	\ 'hook/time/format': "\n--- Runtime %.2f sec ---",
	\ 'outputter/buffer/name': 'quickrun',
	\ 'outputter/buffer/running_mark': QuickRunRunningMark(),
	\ 'outputter/buffer/split':  '%{winwidth(0) * 2 < winheight(0) * 5 ? "" : ""}',
	\ 'outputter/error/success': 'buffer',
	\ 'outputter/error/error': 'quickfix',
	\ 'outputter/quickfix/open_cmd': 'copen',
	\ 'runner': 'vimproc',
	\ 'runner/vimproc/updatetime': 60,
\ }

" --- NEOSNIPPET ---

imap <leader>s <Plug>(neosnippet_expand_or_jump)
xmap <leader>s <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:neosnippet#snippets_directory = '$HOME/dotfiles/nvim/snippets/'

" --- MISC ---

command! -buffer Pbcopy silent !cat % | pbcopy
cnoreabbrev pbcopy Pbcopy

augroup HilightsForce
  autocmd!
  autocmd WinEnter,BufRead,BufNew,Syntax * :silent! call matchadd('Todo', '\(TODO\|NOTE\|INFO\|XXX\|TEMP|FIXME|DEBUG\)')
  autocmd WinEnter,BufRead,BufNew,Syntax * highlight Todo guibg=Red guifg=White
augroup END

syntax enable
set noswapfile
set synmaxcol=400
set cindent
set shiftwidth=2
set expandtab
set tabstop=2
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch

" let g:python3_host_prog = '/usr/bin/python3'
let g:deoplete#enable_at_startup = 1
let g:better_whitespace_enabled = 0
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm = 0
let g:gist_post_private = 1
