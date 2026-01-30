vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>rr", "<CMD>restart<CR>", { desc = "Restart NeoVim" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open Quickfix" })

vim.keymap.set("n", "-", ":Ex<cr>", { desc = "Explore" })

-- Quick chat keymap
vim.keymap.set('n', '<leader>aa', function()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input, {
      selection = require("CopilotChat.select").buffer
    })
  end
end, { desc = "CopilotChat - Quick chat" })

vim.keymap.set('n', '<leader>aq', function()
  local Input = require("nui.input")
  local event = require("nui.utils.autocmd").event

  local input = Input({
    position = "50%",
    size = {
      width = 40,
    },
    border = {
      style = "single",
      text = {
        top = "[CopilotChat]",
        top_align = "center",
      },
    },
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:Normal",
    },
  }, {
    on_close = function()
      print("Input Closed!")
    end,
    on_submit = function(value)
      if value ~= "" then
        require("CopilotChat").ask(value, {
          selection = require("CopilotChat.select").buffer
        })
      end
    end,
  })

  -- mount/open the component
  input:mount()

  -- unmount component when cursor leaves buffer
  input:on(event.BufLeave, function()
    input:unmount()
  end)
end, { desc = "UI Prompt" })
