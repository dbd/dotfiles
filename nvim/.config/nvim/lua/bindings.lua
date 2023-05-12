-- Built in bindings
vim.api.nvim_set_keymap("n", "<space>", "za", {})
vim.api.nvim_set_keymap("n", "<C-N>", ":noh<cr>", {})

vim.api.nvim_set_keymap("n", "<C-T>", ":tabnew<cr>", {})
vim.api.nvim_set_keymap("n", "<C-Q>", ":tabc<cr>", {})

vim.api.nvim_set_keymap("n", "<C-J>", "<C-W>j", {})
vim.api.nvim_set_keymap("n", "<C-K>", "<C-W>k", {})
vim.api.nvim_set_keymap("n", "<C-L>", "<C-W>l", {})
vim.api.nvim_set_keymap("n", "<C-H>", "<C-W>h", {})

vim.api.nvim_set_keymap("n","<leader>T", "j:s# #,#g<CR>:noh<CR>", {})
vim.api.nvim_set_keymap("n","<leader>b", "<ESC>:!jblack %<CR>", {})

-- FZF
vim.api.nvim_set_keymap("n", "<leader>co", ":CO<cr>", {silent = true})
vim.api.nvim_set_keymap("n", "<leader>ses", ":SE<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>N", ":Windows<CR>", {})
vim.api.nvim_set_keymap("n", "<C-G>", ":Rg<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>rg", ":Rg <C-R><C-W><cr>", {silent = true})
vim.api.nvim_set_keymap("n", "F", ":FZF<cr>", {})

-- NerdTree
vim.api.nvim_set_keymap("n", "<leader>N", "<ESC>:NERDTree<CR>", {})

-- Go
vim.api.nvim_set_keymap("n", "<leader>f", ":GoFmt", {})

-- Unite
vim.api.nvim_set_keymap("n", ";", ":Unite command -start-insert -ignorecase<CR>", {})
vim.api.nvim_set_keymap("n", "'", ":Unite buffer -start-insert -ignorecase<CR>", {})

-- Git
vim.api.nvim_set_keymap("n", "gb", ":Git blame<cr>", {})
vim.api.nvim_set_keymap("n", "gs", ":Git show<cr>", {})
vim.api.nvim_set_keymap("n", "gss", ":Git show<C-R><C-W><cr>", {})
vim.api.nvim_set_keymap("n", "gl", ":Git log -n10<cr>", {})

-- Python

-- coc
vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", {silent = true})
vim.api.nvim_set_keymap("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
vim.api.nvim_set_keymap("n", "gi", "<Plug>(coc-implementation)", {silent = true})
vim.api.nvim_set_keymap("n", "gr", "<Plug>(coc-references)", {silent = true})

