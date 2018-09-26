set guifont=Menlo\ Regular:h18
set number

set clipboard=unnamedplus

set tabstop=2
set shiftwidth=2
set expandtab

set tw=79

set hlsearch

set smartindent
set autoindent

"If the current buffer has never been saved, it will have no name,
"call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified
            \|if empty(bufname('%'))
                \|browse confirm write
            \|else
                \|confirm write
            \|endif
\|endif
"nnoremap <silent> <C-S> :<C-u>Update<CR>
"inoremap <silent> <Up> <ESC><Up>
"inoremap <silent> <Down> <ESC><Down>

"":inoremap <C-S> <Esc>:Update<CR>

"let mapleader=" "


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'python-mode/python-mode'
Plugin 'pangloss/vim-javascript'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'derekwyatt/vim-scala'
Plugin 'vim-airline/vim-airline'
Plugin 'Raimondi/delimitMate'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'neomake/neomake'
Plugin 'tpope/vim-fugitive'
call vundle#end()
filetype plugin indent on
syntax on
let python_highlight_all=1

highlight Normal ctermbg=none
highlight NonText ctermbg=none

autocmd! BufWritePost * Neomake

let g:neomake_javascript_enabled_makers = ['eslint']

let g:neomake_elixir_credo_maker= {
      \ 'exe': 'mix',
      \ 'args': ['credo', 'list', '%:p', '--format=oneline', '--strict'],
      \ 'postprocess': function('neomake#makers#ft#elixir#PostprocessCredo'),
      \ 'errorformat':
          \'[%t] %. %f:%l:%c %m,' .
          \'[%t] %. %f:%l %m'
      \ }
let g:neomake_elixir_enabled_makers = ['credo']

inoremap <silent><Up> <ESC><Up>
inoremap <silent><Down> <ESC><Down>
