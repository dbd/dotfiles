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
vim.opt.ignorecase = true
vim.opt.smartcase = true


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
vim.opt.conceallevel = 2

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


--bindings
require("plugins")
vim.cmd("colorscheme one")
require("bindings")
require("lualine").setup()
require("fzf")
-- require("go")
require("python")
require("ale_config")
require("coc")
require("crush")
