return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy", -- Load plugin when Neovim is fully loaded
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
    config = function()
      local wk = require("which-key")

      -- Setup which-key with helix-style preset for key hints
      wk.setup({
        preset = 'helix',
      })

      -- Register key group mappings for better organization
      wk.add({
        { "<leader>s", group = "search" }, -- Define search-related commands group
      })
    end,
  },
}
