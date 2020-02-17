set ttyfast

set rtp+=/usr/local/opt/fzf

set nocompatible
filetype off

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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
Plug 'fatih/vim-go'

" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

nmap ; :Unite buffer -start-insert -ignorecase<CR>
call plug#end()

"
" ==== Vim config ====
"
syntax enable
set background=dark
set termguicolors     " enable true colors support
colorscheme one
" basic
set encoding=utf-8 nobomb
set cursorline
set number

" Folding
nnoremap <space> za
set foldmethod=indent
set foldlevel=1000

" Unhighlight things
nmap <C-N> :noh<CR>

"remap pane movement
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" show text replacement live
set inccommand=nosplit

"
" ==== Languages ====
"
" Python
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

"
" ==== Plugin Configs ====
"
" Nerdtree - file explorer
autocmd VimEnter * NERDTree
let NERDTreeMinimalUI = 1

" Ale - linting
let g:ale_linters = {'python': ['flake8']}

" Tagbar
nmap T :TagbarToggle<CR>

" YCM - code completion
" Tab completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
let g:ycm_autoclose_preview_window_after_insertion = 1
nmap <C-D> :YcmCompleter GetDoc<CR>
nmap <C-Q> :pc<CR>

" Ripgrep - code search
nmap <C-G> :Rg<CR>
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>

" FZF - file search
nmap F :FZF<CR>
" Options for fzf searching return syntax
command! -bang -nargs=* Find cal fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!./git/*" --color "always"'.shellescape(<q-args>), 1, <bang>0)

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-S>"
let g:UltiSnipsJumpForwardTrigger="<C-N>"
let g:UltiSnipsJumpBackwardTrigger="<C-P>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'index': 'readme',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" don't let all markdown files be vimwiki
let g:vimwiki_global_ext = 0
let g:vimwiki_markdown_link_ext = 1

