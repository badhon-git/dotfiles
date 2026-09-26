" Rubya Akter Badhon 

" set compatibility
set nocompatible   
" filetype off                  " required

" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

if filereadable(expand("~/.vimrc.plug"))
	source ~/.vimrc.plug
endif

" plugins
" Plugin 'VundleVim/Vundle.vim'
" Plug 'dense-analysis/ale'
" Plugin 'nvie/vim-flake8'

syntax on

set t_Co=256

"colorscheme atom-dark-256

set foldmethod=indent

set foldlevel=99

" au BufNewFile, BufRead *.py
" 	\ set tabstop=4
" 	\ set softtabstop=4
" 	\ set shiftwidth=4
" 	\ set textwidth=79
" 	\ set expantab
" 	\ set autoindent
" 	\ set fileformat=unix

" let g:ale_linters = {'python': ['flake8']}

" wrap text
set wrap

"encoding
set encoding=utf-8

"line numbers
set number

" status bar
set laststatus=2

nnoremap mod1 <esc>
vnoremap<C-c> "+y
map<C-p> "+p

" latex
call plug#begin()
Plug 'lervag/vimtex'
call plug#end()

filetype plugin indent on
syntax enable
set encoding=utf-8
"let g:vimtex_compiler_method = 'latexmk'
"let g:vimtex_compiler_bibtex = 'biber'

let g:tex_flavor = 'latex' 
let g:vimtex_view_method = 'zathura'  " Used Zathura for PDFs
let g:vimtex_compiler_method = 'latexmk'  " Used latexmk for compilation
let g:vimtex_compiler_latexmk = {
  \ 'build_dir' : '.latexmk',
  \ 'options' : [
  \   '-pdf',
  \   '-shell-escape',
  \   '-verbose',
  \   '-file-line-error',
  \   '-synctex=1',
  \   '-interaction=nonstopmode',
  \ ],
  \ 'continuous' : 1,
  \}
let g:vimtex_enabled = 1
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'biber',
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'options' : [
    \   '-pdf',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
"let g:vimtex_compiler_latexmk = {
  \ 'backend' : 'biber',  " backend to biber for BibLaTeX
  \ 'build_dir' : '',
  \ 'continuous' : 1,
  \ 'executable' : 'latexmk',
  \ 'options' : [
  \   '-verbose',
  \   '-file-line-error',
  \   '-synctex=1',
  \   '-interaction=nonstopmode',
  \   '-pvc',  " For continuous preview
  \ ],
\}
autocmd FileType tex nnoremap <localleader>ll :update<CR>:VimtexCompile<CR>
