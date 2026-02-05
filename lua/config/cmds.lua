-- Overide LSP-related settings and keymaps when an LSP client attaches to a buffer
-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(args)
--     vim.keymap.del("n", "K", { buffer = args.buf })
--   end,
-- })

vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "diff",
  callback = function()
    if vim.wo.diff then
      vim.keymap.set("n", "<C-y>", "dp", { buffer = true })
      vim.keymap.set("n", "<C-u>", "do", { buffer = true })
    end
  end,
})
-- Autocmd configuration for view persistence and file monitoring
-- Save view (cursor position, folds, etc.) when leaving a buffer window
vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "?*",
  callback = function()
    vim.cmd("mkview")
  end,
})

-- Restore view (cursor position, folds, etc.) when entering a buffer window
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "?*",
  callback = function()
    vim.cmd("silent! loadview")
  end,
})

-- Check for file changes when gaining focus or moving cursor
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  command = "checktime",
})

-- Notify user when a file is reloaded due to external changes
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  callback = function()
    vim.notify("File changed on disk. Buffer reloaded!", vim.log.levels.WARN)
  end,
})

-- command to get current branch name and print it in the command line
vim.api.nvim_create_user_command("GitBranch", function()
  local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
  local result = handle:read("*a")
  handle:close()
  local branch = result:gsub("\n", "")
  if branch == "" then
    print("Not in a git repository")
  else
    local pattern = "^(%w+%-%d+)[_-]"
    local match = branch:match(pattern)
    if match then
      local cursor = vim.api.nvim_win_get_cursor(0)
      local line = cursor[1] - 1
      local col = cursor[2]
      vim.api.nvim_buf_set_text(0, line, col, line, col, { match })
      print("Inserted: " .. match)
    else
      print("Current branch: " .. branch)
    end
  end
end, {})

vim.keymap.set("n", "<leader>wb", ":GitBranch<CR>", { noremap = true, silent = true, desc = "Get Git Branch" })

-- Always open help in a vertical split on the right
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = vim.api.nvim_create_augroup("help_vertical_split", {}),
  pattern = { "*.txt" },
  callback = function()
    if vim.bo.filetype == "help" then
      vim.cmd("wincmd L") -- Move help window to the far right
    end
  end,
})

-- vim.keymap.set('n', '', function()
--   local new_config = not vim.diagnostic.config().virtual_lines
--   vim.diagnostic.config({ virtual_lines = new_config })
-- end, { desc = 'Toggle diagnostic virtual_lines' })
--
vim.keymap.set("n", "gK", function()
  local new_config = not vim.diagnostic.config().virtual_text
  vim.diagnostic.config({ virtual_text = new_config })
end, { desc = "Toggle diagnostic virtual_text" })
