return {
  {
    'github/copilot.vim',
    config = function(_, opts)
        -- vim.keymap.set('i', '<C-L>', 'copilot#Accept("\\<CR>")', { expr = true, silent = true, replace_keycodes = false })

        vim.keymap.set('i', '<C-;>', '<Plug>(copilot-suggest)')
        vim.keymap.set('i', '<C-Right>', '<Plug>(copilot-accept-word)')

        vim.g.copilot_no_tab_map = true
        vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })

    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
    },
  },
}