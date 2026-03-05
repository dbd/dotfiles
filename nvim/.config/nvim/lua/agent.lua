-- Agent AI integration for Neovim
local M = {}

local agent_buf = nil

-- Toggle Agent terminal split
function M.toggle_agent()
    if agent_buf and vim.api.nvim_buf_is_valid(agent_buf) then
        for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
            if vim.api.nvim_win_get_buf(win) == agent_buf then
                vim.api.nvim_win_close(win, false)
                return
            end
        end
        -- Buffer exists but not visible, show it
        vim.cmd("rightbelow vsplit")
        vim.api.nvim_win_set_buf(0, agent_buf)
        vim.cmd("startinsert")
    else
        vim.cmd("rightbelow vsplit | enew")
        vim.fn.termopen("claude")
        agent_buf = vim.api.nvim_get_current_buf()
        vim.cmd("startinsert")
    end
end

-- Open Agent in a terminal split
function M.open_agent()
    vim.cmd("botright vsplit | terminal claude")
    vim.cmd("startinsert")
end

-- Open Agent with current file as context
function M.open_agent_with_file()
    local file = vim.fn.expand("%:p")
    if file ~= "" then
        vim.cmd("botright vsplit | terminal claude --file " .. vim.fn.shellescape(file))
    else
        vim.cmd("botright vsplit | terminal agent")
    end
    vim.cmd("startinsert")
end

-- Send visual selection to Agent
function M.send_selection_to_agent()
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
    
    vim.cmd("botright vsplit | terminal claude --prompt " .. escaped)
    vim.cmd("startinsert")
end

-- Open Agent in a floating window
function M.open_agent_float()
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

    vim.fn.termopen("claude")
    vim.cmd("startinsert")
end

-- Ask Agent about current file
function M.ask_about_file(prompt)
    local file = vim.fn.expand("%:p")
    local cmd = "claude"
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
vim.api.nvim_create_user_command("Agent", function()
    M.open_agent()
end, {})

vim.api.nvim_create_user_command("AgentFile", function()
    M.open_agent_with_file()
end, {})

vim.api.nvim_create_user_command("AgentFloat", function()
    M.open_agent_float()
end, {})

vim.api.nvim_create_user_command("AgentAsk", function(opts)
    M.ask_about_file(opts.args)
end, { nargs = "?" })

return M
