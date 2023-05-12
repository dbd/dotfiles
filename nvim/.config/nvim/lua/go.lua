vim.g.go_highlight_build_constraints = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_methods = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_structs = 1
vim.g.go_highlight_types = 1
vim.g.go_def_mapping_enabled = 1
-- vim.g.syntastic_go_gometalinter_args = ['--structtag=false']
GOPATH = os.getenv("GOPATH")
vim.g.go_bin_path = vim.fn.expand(GOPATH.."/bin/")
-- let g:go_doc_popup_window = 1 " Doesn't work in nvim
vim.g.go_debug_breakpoint_sign_text = '•'
vim.g.go_def_mapping_enabled = 0
-- autocmd VimAfter Alias gct GoCoverageToggle
vim.g.go_imports_autosave = 1
vim.cmd("au BufEnter,BufNew *.go map <Leader>br :GoDebugBreakpoint <CR>")
-- vim.api.nvim_create_autocmd(
--     {"BufEnter", "BufNew"},
--     {
--         pattern = "go",
--         command = vim.api.nvim_set_keymap("n", "<leader>br", ":GoDebugBreakpoint <CR>", {})
--     }
-- )
