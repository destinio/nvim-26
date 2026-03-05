return {
  {
    "stevearc/aerial.nvim",
    opts = {},
    config = function()
      require("aerial").setup({})
      vim.keymap.set("n", "<leader>ta", "<cmd>AerialToggle!<CR>")
    end,
  },
}
