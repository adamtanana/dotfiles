sy on

set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set smartindent
set number
set ts=4
set sw=4
set autoindent
set expandtab
set cindent

set relativenumber
set showmatch

set comments=sl:/*,mb:\ *,elx:\ */

set laststatus=2

map <F4> :!./% <CR>
set whichwrap+=<,>,h,l,[,]

set clipboard=unnamedplus
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline_status-2.6.dev9999+git.6257332372bf9f64d928b6a3b53d2842d9c7e01f-py2.7.egg/powerline/bindings/vim

imap jj <Esc>

noremap % v%

let g:go_fmt_command = "goimports"

:autocmd BufWritePost *.go GoImports

call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'ntpeters/vim-better-whitespace'
Plug 'zchee/nvim-go', { 'do': 'make'}
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sleuth'
Plug 'isruslan/vim-es6'
call plug#end()

let g:ale_completion_enabled = 1

let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_echo_current_diagnostic = 0

let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#enabled = 1

let g:strip_whitespace_on_save=1
let g:better_whitespace_enabled=1
let g:better_whitespace_ctermcolor=4

let g:ale_linters = {
    \ 'c': ['cppcheck', 'flawfinder', 'uncrustify', 'clangd'],
    \ 'python': [],
    \ 'go': ['golint', 'gofmt', 'gobuild']}

" Setup nerd tree
" \ 'python': [],
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let mapleader = ","
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>l :noh<CR>

set undofile
set undodir=/tmp/

if has("autocmd")
    " file templates
    augroup templates
        " c files
        au BufNewFile *.c
                    \ 0r ~/.vim/templates/skeleton.c
        au BufNewFile attack*.py
                    \ 0r ~/.vim/templates/pwntools.py
        au BufNewFile sol.py
                    \ 0r ~/.vim/templates/pwntools.py
    augroup END

    autocmd BufNewFile,BufRead *.go setlocal noexpandtab
    au BufNewFile,BufRead *.ts setlocal filetype=typescript
    au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
endif
:nnoremap <space> i<space><esc>
