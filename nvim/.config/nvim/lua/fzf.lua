vim.cmd([[
command! -bang -nargs=* Find
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --ignore-file ".gitignore" --glob "!./git/*" --color "always"'.shellescape(<q-args>),
    \   1,
    \   <bang>0)
]])

vim.cmd([[
command! -bang -nargs=* RG
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>),
    \   1,
    \   fzf#vim#with_preview({'options': ['--info=inline', '--preview', '~/.vim/packer/fzf.vim/bin/preview.sh {}']}),
    \   <bang>0)
]])

vim.cmd([[
command! CO
    \ call fzf#run({
    \   'source': "git branch --all --no-color -q --format '%(regname:short)' | sed '#origin/##'",
    \   'sink': 'Git checkout',
    \   'options': '--preview "git reflog --pretty\"%cd %h %gd %gs\" --date format:\"%y%m%d-%H:%m\" {+}" --preview-window=up',
    \   'window': {
    \       'width': 0.9,
    \       'height': 0.8
    \   }
    \})
]])

vim.cmd([[
command! -nargs=1 OpenSession call _OpenSession(<f-args>)
]])

vim.cmd([[
function! _OpenSession(...)
  let b:filename = "~/.config/nvim/sessions/" . a:1 . ".vim"
  exe "source " . b:filename
endfunction
]])

vim.cmd([[
command! -nargs=1 SaveSession call _SaveSession(<f-args>)
]])

vim.cmd([[
function! _SaveSession(...)
  let b:filename = "~/.config/nvim/sessions/" . a:1 . ".vim"
  exe "mksession " . b:filename
endfunction
]])

vim.cmd([[
command! SE
    \ call fzf#run({
    \   'source': "ls -1 ~/.config/nvim/sessions | sed 's#\.vim##'",
    \   'sink': 'OpenSession',
    \   'options': '--preview "grep edit ~/.config/nvim/sessions/{+}.vim | sed \"s#*.edit ##\" |sed \"s# .*##\""',
    \   'window': {
    \       'width': 0.9,
    \       'height': 0.8
    \   }
    \})
]])
