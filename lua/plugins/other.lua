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
      { "gA", mde = { "n", "v" } },
    },
  },
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },
  {
    "mgierada/lazydocker.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    config = function()
      require("lazydocker").setup({
        border = "curved", -- valid options are "single" | "double" | "shadow" | "curved"
        width = 0.9, -- width of the floating window (0-1 for percentage, >1 for absolute columns)
        height = 0.9, -- height of the floating window (0-1 for percentage, >1 for absolute rows)
      })
    end,
    event = "BufRead",
    keys = {
      {
        "<leader>ld",
        function()
          require("lazydocker").open()
        end,
        desc = "Open Lazydocker floating window",
      },
    },
  },
}
