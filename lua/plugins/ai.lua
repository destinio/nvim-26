-- AI-powered coding assistance plugins:
-- 1. Sidekick.nvim - Bridge between Neovim and external AI CLI tools (Cursor, Copilot Chat, Claude, etc.)
-- 2. Copilot.vim - GitHub Copilot inline completions
return {
  -- https://docs.github.com/en/copilot/concepts/agents/about-copilot-cli
  -- https://github.com/folke/sidekick.nvim
  -- https://cursor.com/docs/cli/overview
  {
    "folke/sidekick.nvim",
    ---@class sidekick.Config
    opts = {
      cli = {
        mux = {
          enabled = true,
          backend = "tmux",
        },
      },
    },
    -- nes = {
    --   -- enabled = false,
    -- },
    keys = {
      {
        "<tab>",
        function()
          if not require("sidekick").nes_jump_or_apply() then
            return "<Tab>" -- fallback to normal tab
          end
        end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle({ name = "cursor", focus = true })
        end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>ad",
        function()
          require("sidekick.cli").close()
        end,
        desc = "Detach a CLI Session",
      },
      -- Send the current symbol/object under cursor to the CLI
      {
        "<leader>at",
        function()
          require("sidekick.cli").send({ msg = "{this}" })
        end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      -- Send the entire current file to the CLI
      {
        "<leader>af",
        function()
          require("sidekick.cli").send({ msg = "{file}" })
        end,
        desc = "Send File",
      },
      -- Send the current visual selection to the CLI
      {
        "<leader>av",
        function()
          require("sidekick.cli").send({ msg = "{selection}" })
        end,
        mode = { "x", "v" },
        desc = "Send Visual Selection",
      },
      -- Open a prompt picker to choose a predefined prompt template
      {
        "<leader>ap",
        function()
          require("sidekick.cli").prompt()
        end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
      -- Toggle Copilot Chat CLI in a focused split
      {
        "<leader>ac",
        function()
          require("sidekick.cli").toggle({ name = "copilot", focus = true })
        end,
        desc = "Sidekick Toggle Copilot Chat",
      },
    },
  },

  -- GitHub Copilot - AI inline code completions
  {
    "github/copilot.vim",
    -- https://docs.github.com/en/copilot/how-tos/configure-personal-settings/configure-in-ide?tool=vimneovim
    config = function()
      -- vim.keymap.set('i', '<C-L>', 'copilot#Accept("\\<CR>")', { expr = true, silent = true, replace_keycodes = false })
      -- vim.keymap.set('i', '<C-Right>', '<Plug>(copilot-accept-word)')
      --

      -- Disable the default Tab accept mapping so it doesn't conflict with other plugins
      vim.g.copilot_no_tab_map = true
      -- Use Shift-Tab to accept the current Copilot suggestion
      vim.keymap.set("i", "<S-Tab>", 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })
    end,
  },
}
