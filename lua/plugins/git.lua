-- https://github.com/pwntester/octo.nvim
return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
      require("scrollbar.handlers.gitsigns").setup()
    end,
  },
  { "sindrets/diffview.nvim", opts = {}, cmd = { "DiffviewOpen" } },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  {
    "FabijanZulj/blame.nvim",
    lazy = false,
    config = function()
      require("blame").setup()

      vim.api.nvim_set_keymap("n", "<leader>gb", ":BlameToggle window<CR>", { noremap = true, silent = true })
    end,
  },
}
