return {
  {
    "stevearc/aerial.nvim",
    -- https://github.com/stevearc/aerial.nvim?tab=readme-ov-file#options
    opts = {},
    config = function()
      require("aerial").setup({})
      vim.keymap.set("n", "<leader>ta", "<cmd>AerialToggle!<CR>")
    end,
  },
}
