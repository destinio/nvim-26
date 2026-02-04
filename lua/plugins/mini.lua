return {
  {
    "nvim-mini/mini.pairs",
    version = false,
    event = "VeryLazy",
    opts = {},
  },
  { "nvim-mini/mini.test", cond = vim.fn.isdirectory("tests") == 1 },
}

