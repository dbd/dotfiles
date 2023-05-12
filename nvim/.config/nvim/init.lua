-- neovim configuration
vim.opt.ttyfast = true
vim.opt.rtp:append("/usr/local/opt/fzf")
-- vim.opt.nocompatible = true
vim.opt.filetype = "off"
vim.opt.syntax = "enable"
-- vim.opt.encoding = "utf-8 nobomb"
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.mouse = ""
vim.opt.inccommand = "nosplit"
vim.opt.updatetime = 100
vim.opt.background = "dark"
vim.opt.encoding = "utf-8"

vim.cmd("colorscheme one")

vim.cmd([[
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
]])

-- folding
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 100000

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

--bindings
require("plugins")
require("bindings")
require("lualine").setup()
require("fzf")
require("go")
require("python")
require("ale")

