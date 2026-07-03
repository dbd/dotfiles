require("neo-tree").setup({
  filesystem = {
    hijack_netrw_behavior = "disabled",
  }
})

vim.api.nvim_set_keymap("n", "<C-S>", ":Neotree toggle<cr>", {})
