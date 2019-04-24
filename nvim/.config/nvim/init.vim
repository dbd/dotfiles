set rtp+=/usr/local/opt/fzf

set nocompatible
filetype off
call plug#begin('~/.vim/plugged')
" Nice toolbar on the bottom
Plug 'vim-airline/vim-airline'
" Color theme
Plug 'rakr/vim-one'
" Show tags in file for quick navigation
Plug 'majutsushi/tagbar'
" File browser instead of netrw
Plug 'scrooloose/nerdtree'
" Use deoplete for file completion
if has('nvim')
    Plug 'Shougo/denite.nvim'
else
    Plug 'Shougo/denite.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'Townk/vim-autoclose'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


nmap ; :Denite -split=floating -winrow=1 buffer<CR>
nmap <leader>t :Denite file/rec -split=floating -winrow=1<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty -mode=normal<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:. -mode=normal<CR>

let g:deoplete#enable_at_startup = 1
call plug#end()

syntax enable
set background=dark
set termguicolors     " enable true colors support
colorscheme one
" basic
set encoding=utf-8 nobomb
set cursorline
set number

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


"remap pane movement
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" Shortcut for tagbar
nmap T :TagbarToggle<CR>

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


