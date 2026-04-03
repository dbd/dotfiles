-- Go uses tabs, not spaces
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.expandtab = false

-- Format + organize imports on save via gopls (coc)
vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = 0,
    callback = function()
        pcall(vim.fn.CocAction, "runCommand", "editor.action.organizeImport")
        vim.fn.CocAction("format")
    end,
})

local opts = { buffer = true, silent = true }

-- Build / run / test
vim.keymap.set("n", "<leader>gb", function()
    vim.cmd("!go build ./...")
end, vim.tbl_extend("force", opts, { desc = "go build" }))

vim.keymap.set("n", "<leader>gr", function()
    vim.cmd("!go run .")
end, vim.tbl_extend("force", opts, { desc = "go run" }))

vim.keymap.set("n", "<leader>gt", function()
    vim.cmd("!go test ./...")
end, vim.tbl_extend("force", opts, { desc = "go test" }))
