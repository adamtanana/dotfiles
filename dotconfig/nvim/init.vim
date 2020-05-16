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

:autocmd BufWritePost *.go GoImports

call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'ntpeters/vim-better-whitespace'
Plug 'zchee/nvim-go', { 'do': 'make'}
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sleuth'
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'
Plug 'isruslan/vim-es6'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
call plug#end()

call glaive#Install()

let g:ale_completion_enabled = 1

let g:airline#extensions#tabline#enabled = 1

let g:strip_whitespace_on_save=1
let g:better_whitespace_enabled=1
let g:better_whitespace_ctermcolor=4

let g:ale_linters = {
    \ 'c': ['cppcheck', 'flawfinder', 'uncrustify', 'clangd'],
    \ 'cpp': ['cppcheck', 'flawfinder', 'uncrustify', 'clangd -std=c++17'],
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

Glaive codefmt plugin[mappings]

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END
