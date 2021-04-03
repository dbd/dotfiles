set ttyfast

set rtp+=/usr/local/opt/fzf

set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
    " Nice toolbar on the bottom
    Plug 'vim-airline/vim-airline'
    let g:airline_powerline_fonts = 1
    " Color theme
    Plug 'rakr/vim-one'
    " File browser instead of netrw
    Plug 'scrooloose/nerdtree'
    " Fuzzy find stuff
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    " Flake8 cause linting sucks
    Plug 'nvie/vim-flake8'
    " Error and syntax highlighting
    Plug 'w0rp/ale'
    " Go plugins
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    Plug 'evanleck/vim-svelte'

    Plug 'machakann/vim-sandwich'
    Plug 'Raimondi/delimitMate'
    Plug 'OmniSharp/omnisharp-vim'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    Plug 'airblade/vim-gitgutter'

call plug#end()

"
" ==== Vim config ====
"
syntax enable

" basic
set encoding=utf-8 nobomb
set cursorline
set number

" Folding
nnoremap <space> za
set foldmethod=indent
set foldlevel=100000

" Unhighlight things
nmap <C-N> :noh<CR>

" Unhighlight things
nmap <C-T> :tabnew<CR>

"remap pane movement
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" show text replacement live
set inccommand=nosplit

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

"
" ==== Languages ====
"
" Python
set tabstop=4
set shiftwidth=4
set expandtab

" Javascript
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
" Yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2

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
nnoremap <leader>n <ESC>:NERDTree<CR>
let NERDTreeMinimalUI = 1

" Ale - linting
let g:ale_linters = {'python': ['flake8']}

" Tagbar
nmap T :TagbarToggle<CR>

" Ripgrep - code search
nmap <C-G> :Rg<CR>
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>

" FZF - file search
nmap F :FZF<CR>
" Options for fzf searching return syntax
command! -bang -nargs=* Find cal fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --ignore-file ".gitignore" --glob "!./git/*" --color "always"'.shellescape(<q-args>), 1, <bang>0)

" omnisharp
let g:OmniSharp_selector_findusages = 'fzf'
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_want_snippet=1

augroup omnisharp_commands
  autocmd!
  autocmd CursorHold *.cs OmniSharpTypeLookup

  autocmd FileType cs nmap <silent> <buffer> <Leader>ff <Plug>(omnisharp_code_format)
augroup END

" omnisharp
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
if !exists('g:context_filetype#same_filetypes')
    let g:context_filetype#filetypes = {}
endif
call deoplete#custom#var('omni', 'functions', { 'css': ['csscomplete#CompleteCSS'] })

"gitgutter
set updatetime=100

"vim-go
let g:go_def_mapping_enabled = 1
let g:syntastic_go_gometalinter_args = ['--structtag=false']


" Stupid tmux stuff
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=dark " for the dark version
" set background=light " for the light version
colorscheme one
