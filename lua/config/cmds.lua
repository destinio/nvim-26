vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "diff",
  callback = function()
    if vim.wo.diff then
      vim.keymap.set("n", "<C-y>", "dp", { buffer = true })
      vim.keymap.set("n", "<C-u>", "do", { buffer = true })
    end
  end,
})
