# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration built on the lazy.nvim plugin manager. The configuration follows a modular architecture with separate files for core configuration, keymaps, and individual plugin setups.

## Architecture

### Entry Point
- `init.lua`: Sets leader keys to space and loads core configuration modules in order:
  1. `config/options.lua` - Editor options
  2. `config/keymaps.lua` - Core keymaps
  3. `config/lazy.lua` - Plugin manager setup

### Plugin Management
- Uses lazy.nvim for plugin management with auto-update checking enabled
- Plugins are auto-loaded from the `lua/plugins/` directory
- Each plugin file in `lua/plugins/` is a separate module that returns a lazy.nvim plugin spec

### Configuration Structure
```
init.lua                    # Entry point
├── lua/config/
│   ├── options.lua        # Editor settings (tabs, scrolling, UI)
│   ├── keymaps.lua        # Core window navigation and utility keymaps
│   └── lazy.lua           # Plugin manager bootstrap and setup
└── lua/plugins/
    ├── lsp.lua            # LSP configuration with Mason
    ├── cmp.lua            # Completion with blink.cmp
    ├── format.lua         # Formatting with conform.nvim
    ├── ai.lua             # GitHub Copilot integration
    ├── telescope.lua      # Fuzzy finding
    ├── files.lua          # Oil.nvim file explorer
    ├── theme.lua          # Catppuccin colorscheme
    ├── statusline.lua     # Mini.statusline
    ├── whichkeys.lua      # Which-key plugin
    ├── mini.lua           # Mini.pairs
    └── random.lua         # Utility plugins
```

## LSP Configuration

### LSP Setup Pattern
LSP configuration in `lua/plugins/lsp.lua` uses a centralized pattern:
1. Mason, Mason-LSPConfig, and Mason-Tool-Installer manage LSP server installations
2. The `servers` table defines enabled LSP servers with optional overrides for `cmd`, `filetypes`, `capabilities`, and `settings`
3. Language servers are configured via `vim.lsp.config()` in Neovim 0.11+ style
4. Capabilities from blink.cmp are merged into each server's configuration

### Currently Enabled Language Servers
- `rust_analyzer` - Rust
- `ts_ls` - TypeScript/JavaScript
- `lua_ls` - Lua with Neovim-specific workspace settings

### Adding a New Language Server
To add a new LSP server, edit `lua/plugins/lsp.lua`:
1. Add the server to the `servers` table with any custom settings
2. Mason will auto-install it via `mason-tool-installer`

Example:
```lua
local servers = {
  rust_analyzer = {},
  ts_ls = {},
  lua_ls = { settings = { ... } },
  -- Add your server:
  pyright = {
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic"
        }
      }
    }
  }
}
```

### LSP Keybindings
LSP keymaps are auto-configured on buffer attach (see lua/plugins/lsp.lua:17-104):
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code action
- `<leader>cd` - Hover documentation
- `gr` - Go to references (via Snacks picker)
- `gI` - Go to implementation
- `gd` - Go to definition
- `gD` - Go to declaration
- `gt` - Go to type definition
- `<leader>ds` - Document symbols
- `<leader>ws` - Workspace symbols
- `<leader>th` - Toggle inlay hints

Note: LSP navigation commands (`gr`, `gI`, `gd`, `gD`, `gt`) use Snacks picker, not Telescope.

## Completion

Uses blink.cmp with default keymap preset:
- `C-space` - Open completion menu / show docs if menu already open
- `C-n`/`C-p` or `Up`/`Down` - Navigate items
- `C-y` - Accept completion
- `C-e` - Hide menu
- Auto-show documentation is disabled by default

Sources: LSP, path, snippets, buffer

## Formatting

Formatting is handled by conform.nvim with format-on-save enabled (500ms timeout, LSP fallback):
- Lua: stylua
- Python: black
- JS/TS/HTML/CSS/JSON/Markdown: prettier

To add a new formatter, edit `lua/plugins/format.lua` and add to `formatters_by_ft`.

## AI Integration

GitHub Copilot is configured with custom keybindings:
- `<C-I>` - Trigger Copilot suggestion (insert mode)
- `<C-Right>` - Accept next word (insert mode)
- `<S-Tab>` - Accept completion (insert mode)
- Tab mapping is disabled (`vim.g.copilot_no_tab_map = true`)

CopilotChat.nvim is also installed for conversational AI assistance.

## Key Mappings

### Window Navigation
- `<C-h/j/k/l>` - Navigate between splits

### File Navigation
- `<leader>sf` - Telescope find files
- `<leader>sg` - Telescope live grep
- `<leader>sb` - Telescope buffers
- `<leader>sh` - Telescope help tags
- `\` - Open Oil.nvim file explorer
- `-` - Open Netrw explorer
- `<leader>to` - Open Oil.nvim

### Utilities
- `<Esc>` - Clear search highlights (normal mode)
- `<Esc><Esc>` - Exit terminal mode
- `<leader>rr` - Restart Neovim
- `<leader>q` - Open quickfix list with diagnostics
- `<leader>?` - Show buffer-local keymaps (which-key)

## Editor Configuration

Key editor settings (from lua/config/options.lua):
- 2-space indentation with smart indent
- Relative line numbers with cursorline
- No swap files, persistent undo enabled
- 10-line scrolloff for context
- Global statusline (laststatus=3)
- Rounded window borders
- Diagnostic signs with nerd font icons
- 300ms timeout for which-key and key sequences

## Modifying This Configuration

### Adding a Plugin
Create a new file in `lua/plugins/` that returns a lazy.nvim plugin spec:
```lua
return {
  {
    "author/plugin-name",
    config = function()
      require("plugin-name").setup({})
    end,
  }
}
```

### Changing Options
Edit `lua/config/options.lua` to modify editor behavior.

### Adding Keymaps
- Core keymaps: `lua/config/keymaps.lua`
- Plugin-specific keymaps: Within the plugin's config function in `lua/plugins/`
