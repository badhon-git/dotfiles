" Rubya Akter Badhon

set nocompatible

if filereadable(expand("~/.vimrc.plug"))
	source ~/.vimrc.plug
endif

syntax on
set t_Co=256

"colorscheme atom-dark-256

set foldmethod=indent
set foldlevel=99

" Python settings
autocmd BufNewFile,BufRead *.py
    \ set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

let g:ale_linters = {'python': ['flake8']}

" wrap text
set wrap

" encoding
set encoding=utf-8

" line numbers
set number

" status bar
set laststatus=2

nnoremap mod1 <esc>
vnoremap <C-c> "+y
map <C-p> "+p

" latex
filetype plugin indent on
syntax enable
set encoding=utf-8

let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_enabled = 1
let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'biber',
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

autocmd FileType tex nnoremap <localleader>ll :update<CR>:VimtexCompile<CR>
