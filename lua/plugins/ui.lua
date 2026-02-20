return {
  {
    "b0o/incline.nvim",
    config = function()
      require("incline").setup()
    end,
    -- Optional: Lazy load Incline
    event = "VeryLazy",
  },
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end,
  },
  { "kevinhwang91/nvim-bqf", ft = "qf", opts = {} },
  -- Lua
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        backdrop = 0.95,
      },
    },
    config = function()
      vim.keymap.set("n", "<leader><space>", function()
        require("zen-mode").toggle()
      end, { desc = "Toggle Zen Mode" })
    end,
  },
}
