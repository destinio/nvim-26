return {
  {
    'github/copilot.vim',
    -- https://docs.github.com/en/copilot/how-tos/configure-personal-settings/configure-in-ide?tool=vimneovim
    config = function()
      -- vim.keymap.set('i', '<C-L>', 'copilot#Accept("\\<CR>")', { expr = true, silent = true, replace_keycodes = false })

      vim.keymap.set('i', '<C-I>', '<Plug>(copilot-suggest)', { silent = true })
      -- vim.keymap.set('i', '<C-Right>', '<Plug>(copilot-accept-word)')
      --

      vim.g.copilot_no_tab_map = true
      vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })
    end,
  },
  {
    "folke/edgy.nvim",
    optional = true,
    opts = function(_, opts)
      opts.right = opts.right or {}
      table.insert(opts.right, {
        ft = "copilot-chat",
        title = "Copilot Chat",
        size = { width = 50 },
      })
    end,
  },
  {
    -- https://github.com/CopilotC-Nvim/CopilotChat.nvim/wiki/Examples-and-Tips
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    cmd = { "CopilotChat" },
    -- keys = {
    --   {
    --     "<leader>aa",
    --     "<cmd>CopilotChatToggle<cr>",
    --     desc = "Open Copilot Chat",
    --   },
    -- },
    config = function()
      require("CopilotChat").setup({
        model = "claude-sonnet-4",
        highlight_headers = false,
        separator = '---',
        error_header = '> [!ERROR] Error',
      })
    end,
  },
  {
    -- https://github.com/MeanderingProgrammer/render-markdown.nvim
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      file_types = { 'markdown', 'copilot-chat' },
    },
    ft = { 'markdown', 'copilot-chat' },
  },
  {
    'sindrets/diffview.nvim',
    config = function()
      require('diffview').setup()
    end,
  },
}
