vim.api.nvim_create_autocmd(
    {"BufWritePost"},
    {
        pattern = "py",
        command = "call flake8#Flake8()"    
    }
)
-- vim.api.nvim_create_autocmd(
--     {"BufEnter", "BufNew"},
--     {
--         pattern = "py",
--         command = vim.api.nvim_set_keymap("n", "<leader>br", "o__import__('ipdb').set_trace()<ESC>", {})
--     }
-- )

vim.g.flake8_show_quickfix = 0
vim.g.flake8_show_in_gutter = 1

-- vim.g.python3_host_prog = "/home/ddaniels/miniconda3/bin/python3.7"
