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
    " Show tags in file for quick navigation
    Plug 'majutsushi/tagbar'
    Plug 'lvht/tagbar-markdown'
    " File browser instead of netrw
    Plug 'scrooloose/nerdtree'
    " Plug 'valloric/youcompleteme'
    Plug 'Raimondi/delimitMate'
    Plug 'Shougo/unite.vim'
    Plug 'lepture/vim-jinja'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'nvie/vim-flake8'
    Plug 'w0rp/ale'
    Plug 'fatih/vim-go'

    Plug 'Konfekt/vim-alias'
    " Snippets are separated from the engine. Add this if you want them:
    Plug 'honza/vim-snippets'

    Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

    " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " Plug 'deoplete-plugins/deoplete-jedi'
    " Plug 'davidhalter/jedi-vim'

    Plug 'machakann/vim-sandwich'

nmap ; :Unite buffer -start-insert -ignorecase<CR>
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

" New tab
map <C-T> :tabnew<CR>

"remap pane movement
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" show text replacement live
set inccommand=nosplit

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
" source ~/.vimrc

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
nnoremap <leader>N <ESC>:NERDTree<CR>
let NERDTreeMinimalUI = 1

" Ale - linting
let g:ale_linters = {'python': ['flake8']}

" Tagbar
nmap T :TagbarToggle<CR>

" deoplete - code completion
" Tab completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
let g:deoplete#enable_at_startup = 1

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
" Vim-Jedi - completion and goto stuff
let g:jedi#goto_stubs_command = "<leader>S"

" Go
nnoremap <leader>f <ESC>:GoFmt<CR>
let g:go_def_mapping_enabled = 0
" autocmd VimAfter Alias gct GoCoverageToggle
let g:go_imports_autosave = 1
if exists('s:loaded_vimafter')
  silent doautocmd VimAfter VimEnter *
else
  let s:loaded_vimafter = 1
  augroup VimAfter
    autocmd!
    autocmd VimEnter * Alias gct GoCoverageToggle
  augroup END
endif
