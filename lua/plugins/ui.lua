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
  -- {
  --   "kevinhwang91/nvim-hlslens",
  --   config = function()
  --     require("hlslens").setup({
  --       build_position_cb = function(plist, _, _, _)
  --         require("scrollbar.handlers.search").handler.show(plist.start_pos)
  --       end,
  --     })
  --
  --     vim.cmd([[
  --       augroup scrollbar_search_hide
  --           autocmd!
  --           autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
  --       augroup END
  --   ]])
  --   end,
  -- },
}
