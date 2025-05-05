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

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'python', 'html', 'markdown', 'vim'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  use 'rakr/vim-one'
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt=true }
  }
  use 'Raimondi/delimitMate'
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'Shougo/unite.vim'
  use 'machakann/vim-sandwich'
  use {
    'junegunn/fzf',
    run = 'cd ~/.fzf && ./install --all',
  }
  use 'junegunn/fzf.vim'
  use 'nvie/vim-flake8'
  use {
    'fatih/vim-go',
    --config = 'vim.cmd[[GoUpdateBinaries]]'
  }
  use {'nvim-treesitter/nvim-treesitter',
    cmd = 'TSUpdate',
    config = function()
      require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "svelte", "javascript", "typescript", "css", 'html'},
            auto_install = true,
            highlight = {
            enable = true,
            },
      })
    end,
  }
end)
