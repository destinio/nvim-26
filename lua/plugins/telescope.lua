return {
  {
    "nvim-telescope/telescope.nvim",
    -- tag = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- optional but recommended
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      local themes = require("telescope.themes")

      telescope.setup({
        defaults = {
          file_ignore_patterns = { "node_modules", "vendor", "dist" },
          layout_strategy = "horizontal",
          -- layout_strategy = "vertical",
          preview = {
            hide_on_startup = true, -- hide preview when picker opens
          },
          layout_config = {
            vertical = {
              width = 0.6, -- wider center layout
              height = 0.6,
              preview_cutoff = 0, -- always show preview
              prompt_position = "top", -- prompt -> results -> preview
              preview_height = 0.5, -- size when shown
              mirror = true, -- if you want it on the right
            },
            horizontal = {
              width = 0.6,
              height = 0.6,
              preview_cutoff = 120, -- show preview if columns > 120
              prompt_position = "top", -- prompt -> results -> preview
              preview_width = 0.4, -- size when shown
            },
          },
          sorting_strategy = "ascending",
          path_display = { shorten = { len = 3 } },
          mappings = {
            i = {
              ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
            },
            n = {
              ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
            },
          },
        },
        extensions = {
          -- https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions#different-plugins-with-telescope-integration
          ["ui-select"] = {
            themes.get_dropdown(),
          },
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
        },
      })

      vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "files" })
      vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "live grep" })
      vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "buffers" })
      vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "help" })
      vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "keymaps" })
      vim.keymap.set("n", "<leader>so", builtin.oldfiles, { desc = "old files" })
      vim.keymap.set("n", "<leader>ss", builtin.git_status, { desc = "old files" })
    end,
  },
}
