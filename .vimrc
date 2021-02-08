" Vundle
set nocompatible              " be iMproved, required per Vundle
filetype off                  " required per Vundle

" Adding Fuzzy Finder
set rtp+=/usr/local/opt/fzf

" Vundle shit
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'fatih/vim-go'
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
Plugin 'buoto/gotests-vim'
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
 " super charged 'paste from clipboard in insert mode'
 inoremap <C-v> "+gP
 " super charged 'paste from clipboard in normal mode'
 nnoremap <C-v> "+gP
 " super charged 'paste from clipboard in visual mode'
 vnoremap <C-v> "+gP

"Set Mouse?
set mouse=a

"Making backspace work with a Mac
set backspace=indent,eol,start

" TABS
 set tabstop=2
   " tabs as two spaces
   set shiftwidth=2
   set expandtab
   
   set smartindent " autoindent
   set autoindent
  
   set tw=79       " page width
 
" GO tabs
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" GO highlights
"let g:go_highlight_build_constraints = 1
"let g:go_highlight_extra_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_types = 1
"let g:go_auto_sameids = 1
"let g:go_fmt_command = "goimports"

" GO Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

" Maybe this works for the json
let g:ale_json_fixjson_executable = 1

" Line Numbers
set number  " Show current line numer
set relativenumber  " Show relative line numbers

" Highlight search
set hlsearch    " highlight search

"Organizing swap files to go to ~/.vim/tmp
set directory^=$HOME/.vim/tmp/

"Ale Config
let g:ale_elixir_credo_strict=1
let g:ale_python_flake8_executable = 'python3'

let g:ale_linters = {
  \ 'go': ['gofmt']
  \}

let g:ale_fixers = {
  \ 'javascript': ['eslint', 'trim_whitespace'],
  \ 'javascript.jsx': ['eslint', 'trim_whitespace'],
  \ 'jsx': ['eslint', 'trim_whitespace'],
  \ 'python': ['autopep8', 'trim_whitespace'],
  \ 'elixir': ['mix_format', 'trim_whitespace'],
  \ 'exs': ['mix_format', 'trim_whitespace'],
  \ 'go': ['gofmt']
  \}

let g:ale_javascript_eslint_use_global = 1

let g:ale_fix_on_save = 1

" Arrow Esc mapping
inoremap <silent><Up> <ESC><Up>
inoremap <silent><Down> <ESC><Down>

" jk esc mapping
inoremap jk <Esc>
inoremap kj <Esc>

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

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------
" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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
inoremap <silent><expr> <c-space> coc#refresh()
" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
