return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        "~/.local/share/nvim/lazy/",
      },
    },
  },
  { "markdown-preview.nvim", enabled = false },
  {
    "Wansmer/treesj",
    keys = {
      "<space>m", -- toggle
      "<space>j", -- join
      -- '<space>s', -- split
      { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    },
    opts = { use_default_keymaps = false, max_join_length = 150 },
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
    config = function()
      require("treesj").setup({ --[[ your config ]]
      })
    end,
  },
  {
    "nvim-mini/mini.align",
    opts = {},
    keys = {
      { "ga", mode = { "n", "v" } },
      { "gA", mode = { "n", "v" } },
    },
  },
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  { "nvim-mini/mini.test", cond = vim.fn.isdirectory("tests") == 1 },
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },
  { "akinsho/bufferline.nvim", opts = { options = { separator_style = "" } } },
}
