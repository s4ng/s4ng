inoremap jj <Esc>
set clipboard=unnamed
"Save
nnoremap <silent> <C-S> :w<cr>

".../AppData/local/nvim/<here>
"===================PlugIn ====================
call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'skywind3000/asyncrun.vim'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'dense-analysis/ale'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"==================Plugin Setting=================
" open quickfix window automatically when AsyncRun is executed
" set the quickfix window 6 lines height.
let g:asyncrun_open = 6

" ring the bell to notify you job finished
let g:asyncrun_bell = 1
let g:asyncrun_encs = 'utf-8'
" F10 to toggle quickfix window
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1

nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeDirArrows = 1
"autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:delimitMate_autoclose = 1
let g:delimitMate_matchpairs = "(:),[:],{:}"
let g:delimitMate_jump_expansion = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_inside_quotes = 1

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#confirm() :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <S-Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<S-Tab>" :
      \ coc#refresh()

"=================Key Settings ====================

if has("autocmd")
  augroup vimrcCompileMap
    " Remove ALL autocommands for the current group. This prevents having the
    " autocommands defined twice (e.g., after sourcing the .vimrc file again).
    autocmd!

    autocmd FileType c noremap <silent> <F4> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
    autocmd FileType c noremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) -mode=4 "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
    autocmd FileType cpp noremap <silent> <F4> :AsyncRun g++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
    autocmd FileType cpp noremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) -mode=4 "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
    autocmd FileType java noremap <silent> <F4> :AsyncRun javac % <cr>
    autocmd FileType java noremap <silent> <F5> :AsyncRun -cwd=$(VIM_FILEDIR) -mode=4 -raw java -classpath . %:r <cr>
    autocmd FileType python map <F5> :AsyncRun -mode=4 -raw python % <cr>
    autocmd FileType javascript map <F5> :AsyncRun -mode=4 -raw node % <cr>

  augroup END
endif

inoremap {<CR> {<CR>} <C-o>O

"===============ale linter=====================

let g:ale_lint_on_save = 1              "Lint when saving a file
let g:ale_sign_error = '✖'                                                      "Lint error sign
let g:ale_sign_warning = '⚠'                                                    "Lint warning sign
let g:ale_statusline_format =[' %d E ', ' %d W ', '']                           "Status line texts
"let g:ale_linters = {'javascript': ['eslint']} 
"let g:ale_fixers = {'javascript': ['prettier', 'eslint']}  

"=================settings=====================
set encoding=utf-8
set fileencodings=utf-8,cp949
set autoindent
set cindent
set smartindent
set tabstop=4
set shiftwidth=4
set number
set ruler
set title
set wrap
set cursorline
set mouse=a
set number relativenumber
set nu rnu

"color scheme setting
let g:material_theme_style = 'darker'
let g:airline_theme='material'
colorscheme material
