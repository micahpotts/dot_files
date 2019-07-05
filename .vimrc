" Vundle
set nocompatible              " be iMproved, required per Vundle
filetype off                  " required per Vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'Raimondi/delimitMate'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'Yggdroot/indentLine'
Plugin 'airblade/vim-gitgutter'
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-syntastic/syntastic'
call vundle#end()
filetype plugin indent on
syntax on
let python_highlight_all=1

" Changing indentline char
let g:indentLine_char = '|'
let g:indentLine_color_term = 239


" super charged 'yank to clipboard'
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-c> "+y
vnoremap <C-c> "+y
" " super charged 'paste from clipboard in insert mode'
" inoremap <C-v> "+gP
" " super charged 'paste from clipboard in normal mode'
" nnoremap <C-v> "+gP
" " super charged 'paste from clipboard in visual mode'
" vnoremap <C-v> "+gP

"Set Mouse?
set mouse=a

" TABS
 set tabstop=2
   " tabs as two spaces
   set shiftwidth=2
   set expandtab
   
   set smartindent " autoindent
   set autoindent
  
   set tw=79       " page width
 
" Line Numbers
set number  " Show current line numer
set relativenumber  " Show relative line numbers

" Highlight search
set hlsearch    " highlight search

"Organizing swap files to go to ~/.vim/tmp
set directory^=$HOME/.vim/tmp//

"Ale Config
let g:ale_elixir_credo_strict=1

let g:ale_fixers = {
  \ 'javascript': ['eslint', 'trim_whitespace'],
  \ 'javascript.jsx': ['eslint', 'trim_whitespace'],
  \ 'jsx': ['eslint', 'trim_whitespace'],
  \ 'python': ['autopep8', 'trim_whitespace'],
  \ 'elixir': ['mix_format', 'trim_whitespace'],
  \ 'exs': ['mix_format', 'trim_whitespace']
  \}

let g:syntastic_javascript_checkers = ['eslint']
let g:ale_javascript_eslint_use_global = 1

let g:ale_fix_on_save = 1

" Arrow Esc mapping
inoremap <silent><Up> <ESC><Up>
inoremap <silent><Down> <ESC><Down>

" NERDTree show dot files
let NERDTreeShowHidden=1

" NerdCommenter Settings
filetype plugin on    " required per nerdcommenter
" Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code
" indentation
" let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a
" region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

au BufRead,BufNewFile *.exs set filetype=elixir
au BufRead,BufNewFile *.ex set filetype=elixir
