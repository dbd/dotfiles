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

--bindings
-- on a fresh machine, packer.nvim itself is bootstrapped here but the
-- plugins it manages are only installed asynchronously (see plugins.lua).
-- guard requires of plugin-provided modules with pcall so a first run
-- doesn't hard-error; a restart after the install finishes picks them up.
require("plugins")

local ok_onedark, onedark = pcall(require, "onedark")
if ok_onedark then
    onedark.setup({
        style = "dark",
        highlights = {
            DiffAdd    = { bg = "#2d4a2d" },
            DiffDelete = { bg = "#4a2d2d" },
            DiffChange = { bg = "#2d3a4a" },
            DiffText   = { bg = "#3a5a6a", fg = "#ffffff" },
        }
    })
    onedark.load()
end
require("bindings")

local ok_lualine, lualine = pcall(require, "lualine")
if ok_lualine then
    lualine.setup({
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = { 'filename' },
            lualine_x = { 'encoding', 'fileformat', 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location', { function() return 'W' .. vim.fn.winnr() end } },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = { { function() return 'W' .. vim.fn.winnr() end } },
        },
    })
end
require("fzf")
require("python")
require("ale_config")
require("coc")
require("agent")
require("netrw")
