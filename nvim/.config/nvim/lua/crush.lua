-- Crush AI integration for Neovim
local M = {}

-- Open Crush in a terminal split
function M.open_crush()
    vim.cmd("botright vsplit | terminal crush")
    vim.cmd("startinsert")
end

-- Open Crush with current file as context
function M.open_crush_with_file()
    local file = vim.fn.expand("%:p")
    if file ~= "" then
        vim.cmd("botright vsplit | terminal crush --file " .. vim.fn.shellescape(file))
    else
        vim.cmd("botright vsplit | terminal crush")
    end
    vim.cmd("startinsert")
end

-- Send visual selection to Crush
function M.send_selection_to_crush()
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")
    local lines = vim.fn.getline(start_pos[2], end_pos[2])
    
    if type(lines) == "string" then
        lines = {lines}
    end
    
    -- Handle partial line selection
    if #lines > 0 then
        lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
        lines[1] = string.sub(lines[1], start_pos[3])
    end
    
    local text = table.concat(lines, "\n")
    local escaped = vim.fn.shellescape(text)
    
    vim.cmd("botright vsplit | terminal crush --prompt " .. escaped)
    vim.cmd("startinsert")
end

-- Open Crush in a floating window
function M.open_crush_float()
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    local buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        style = "minimal",
        border = "rounded",
    })

    vim.fn.termopen("crush")
    vim.cmd("startinsert")
end

-- Ask Crush about current file
function M.ask_about_file(prompt)
    local file = vim.fn.expand("%:p")
    local cmd = "crush"
    if file ~= "" then
        cmd = cmd .. " --file " .. vim.fn.shellescape(file)
    end
    if prompt and prompt ~= "" then
        cmd = cmd .. " --prompt " .. vim.fn.shellescape(prompt)
    end
    vim.cmd("botright vsplit | terminal " .. cmd)
    vim.cmd("startinsert")
end

-- Create user commands
vim.api.nvim_create_user_command("Crush", function()
    M.open_crush()
end, {})

vim.api.nvim_create_user_command("CrushFile", function()
    M.open_crush_with_file()
end, {})

vim.api.nvim_create_user_command("CrushFloat", function()
    M.open_crush_float()
end, {})

vim.api.nvim_create_user_command("CrushAsk", function(opts)
    M.ask_about_file(opts.args)
end, { nargs = "?" })

return M
