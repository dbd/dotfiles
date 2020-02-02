set rtp+=/usr/local/opt/fzf

set nocompatible
filetype off
call plug#begin('~/.vim/plugged')
" Nice toolbar on the bottom
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
" Color theme
Plug 'rakr/vim-one'
" Show tags in file for quick navigation
Plug 'majutsushi/tagbar'
Plug 'lvht/tagbar-markdown'
" File browser instead of netrw
Plug 'scrooloose/nerdtree'
Plug 'valloric/youcompleteme'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/unite.vim'
Plug 'lepture/vim-jinja'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'nvie/vim-flake8'
Plug 'w0rp/ale'
nmap ; :gnite buffer -start-insert -ignorecase<CR>
call plug#end()

syntax enable
set background=dark
set termguicolors     " enable true colors support
colorscheme one
" basic
set encoding=utf-8 nobomb
set cursorline
set number

nnoremap <space> za
set foldmethod=indent
set foldlevel=1000

"python
set tabstop=4
set shiftwidth=4
set expandtab

" Javascript
autocmd FileType javascript setlocal ts=2 sts=2 sw=2

" Go
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1


"setup vim explorer
autocmd VimEnter * NERDTree
let NERDTreeMinimalUI = 1

let g:ale_linters = {'python': ['flake8']}


"remap pane movement
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" Shortcut for tagbar
nmap T :TagbarToggle<CR>

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

nmap <C-N> :noh<CR>

nmap <C-G> :Rg<CR>
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>

nmap F :FZF<CR>
command! -bang -nargs=* Find cal fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!./git/*" --color "always"'.shellescape(<q-args>), 1, <bang>0)

