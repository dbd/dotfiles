require'nvim-treesitter.install'.prefer_git = true
require('nvim-treesitter.configs').setup {
  ensure_installed = { "typescript", "scss", "svelte", "lua" },
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}
