local ok_neotree, neotree = pcall(require, "neo-tree")
if ok_neotree then
  neotree.setup({
    filesystem = {
      hijack_netrw_behavior = "disabled",
    }
  })
end

vim.api.nvim_set_keymap("n", "<C-S>", ":Neotree toggle<cr>", {})
