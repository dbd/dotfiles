vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "svelte",
    command = ":TSUpdate<CR>",
})
