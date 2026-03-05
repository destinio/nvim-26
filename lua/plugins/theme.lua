return {
  {
    "folke/tokyonight.nvim",
    -- https://github.com/folke/tokyonight.nvim
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        transparent = true,
      })

      vim.cmd.colorscheme("tokyonight-night")
    end,
  },
}
