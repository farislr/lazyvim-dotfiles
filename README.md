# LazyVim Configuration

A comprehensive Neovim configuration built on top of [LazyVim](https://github.com/LazyVim/LazyVim), featuring modern development tools, language support, and AI assistance.

## ✨ Features

- **🚀 Modern Plugin Management**: Built on [lazy.nvim](https://github.com/folke/lazy.nvim) for fast startup times
- **🎨 Beautiful UI**: Tokyo Night colorscheme with Moon variant
- **🤖 AI-Powered Development**: GitHub Copilot integration for intelligent code completion
- **📝 Language Support**: Go, JSON, Markdown with comprehensive LSP, syntax highlighting, and tooling
- **🔧 Enhanced Editing**: Smart text objects, incremental rename, dial for number manipulation
- **📦 Testing**: Integrated testing framework with neotest
- **🎯 Project Navigation**: Advanced search and file management with telescope
- **📊 Status Line**: Informative status line with lualine
- **🔍 Diagnostics**: Comprehensive error and warning display with trouble.nvim

## 📋 Prerequisites

- **Neovim** >= 0.9.0 (needs to be built with LuaJIT)
- **Git** >= 2.19.0 (for partial clones support)
- A **Nerd Font** (optional, for icons)
- For telescope.nvim (optional):
  - **ripgrep** for live grep functionality
  - **fd** for file finding
- A terminal that supports true color and undercurl
- Go toolchain (for Go language support)

## 🚀 Installation

### Fresh Installation

```bash
# Backup your existing Neovim configuration
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak

# Clone this configuration
git clone https://github.com/your-username/nvim-config ~/.config/nvim

# Start Neovim - plugins will install automatically
nvim
```

### Over Existing LazyVim

If you already have LazyVim installed, you can copy the configuration files:

```bash
# Copy plugin configurations
cp -r /path/to/this/config/lua/plugins/* ~/.config/nvim/lua/plugins/

# Copy extras configuration
cp /path/to/this/config/lazyvim.json ~/.config/nvim/
```

## 📁 Structure

```
~/.config/nvim/
├── init.lua                  # Entry point
├── lazyvim.json             # LazyVim extras configuration
├── lazy-lock.json           # Plugin version lockfile
├── stylua.toml              # Lua formatter configuration
├── lua/
│   ├── config/
│   │   ├── autocmds.lua     # Auto commands
│   │   ├── keymaps.lua      # Custom keymaps
│   │   ├── lazy.lua         # Lazy.nvim setup
│   │   └── options.lua      # Vim options
│   └── plugins/
│       ├── colorscheme.lua  # Theme configuration
│       └── example.lua      # Plugin examples/overrides
└── README.md                # This file
```

## 🔧 Configuration

### Enabled LazyVim Extras

This configuration includes the following LazyVim extras:

- `lazyvim.plugins.extras.ai.copilot` - GitHub Copilot integration
- `lazyvim.plugins.extras.coding.yanky` - Enhanced yank/paste functionality
- `lazyvim.plugins.extras.editor.dial` - Smart increment/decrement
- `lazyvim.plugins.extras.editor.inc-rename` - Incremental rename with preview
- `lazyvim.plugins.extras.lang.go` - Go language support
- `lazyvim.plugins.extras.lang.json` - JSON language support
- `lazyvim.plugins.extras.lang.markdown` - Markdown support with preview
- `lazyvim.plugins.extras.test.core` - Testing framework integration
- `lazyvim.plugins.extras.util.dot` - Dotfiles management
- `lazyvim.plugins.extras.util.mini-hipatterns` - Highlight patterns
- `lazyvim.plugins.extras.vscode` - VSCode compatibility

### Theme Configuration

The configuration uses the Tokyo Night theme with the "moon" variant:

```lua
{
  "folke/tokyonight.nvim",
  lazy = true,
  opts = { style = "moon" },
}
```

### Plugin Performance Optimizations

Several built-in plugins are disabled for better performance:

- gzip
- tarPlugin  
- tohtml
- tutor
- zipPlugin

## 🎯 Key Features

### Language Support

#### Go Development

- Full LSP support with gopls
- Automatic tool installation via Mason
- Testing integration with neotest-golang
- Proper module and workspace handling

#### JSON/JSONC

- Schema validation with SchemaStore.nvim
- Advanced formatting and validation
- Support for comments in JSON

#### Markdown

- Live preview with markdown-preview.nvim
- Enhanced syntax highlighting
- Table editing support

### AI Integration

GitHub Copilot is configured for intelligent code completion:

- Automatic suggestions while typing
- Accept suggestions with `<Tab>`
- Navigate through suggestions with `<C-n>` and `<C-p>`

### Enhanced Editing

- **Yanky**: Advanced yank ring with persistent history
- **Dial**: Smart increment/decrement for numbers, dates, and more
- **Inc-rename**: Live preview while renaming symbols
- **Mini.ai**: Enhanced text objects for better code manipulation

### Testing

Integrated testing with neotest:

- Run tests directly from Neovim
- Visual test results and output
- Support for Go testing framework

## 🛠️ Customization

### Adding New Plugins

Create a new file in `lua/plugins/` or modify existing ones:

```lua
-- lua/plugins/my-plugin.lua
return {
  "author/plugin-name",
  opts = {
    -- Plugin configuration
  },
}
```

### Custom Keymaps

Add your keymaps to `lua/config/keymaps.lua`:

```lua
-- lua/config/keymaps.lua
local map = vim.keymap.set

map("n", "<leader>my", function()
  -- Your custom function
end, { desc = "My custom keymap" })
```

### Vim Options

Modify `lua/config/options.lua` to change Vim settings:

```lua
-- lua/config/options.lua
vim.opt.relativenumber = false  -- Disable relative line numbers
vim.opt.wrap = true            -- Enable line wrapping
```

## 🔍 Default Keymaps

LazyVim provides many default keymaps. Some key ones include:

### General

- `<leader>` - Space (Leader key)
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Browse buffers

### LSP

- `gd` - Go to definition
- `gr` - Go to references  
- `K` - Hover documentation
- `<leader>ca` - Code actions
- `<leader>cr` - Rename symbol

### Testing

- `<leader>tt` - Run nearest test
- `<leader>tT` - Run all tests
- `<leader>ts` - Toggle test summary

For a complete list of keymaps, use `<leader>sk` in Neovim.

## 🔄 Updates

### Update Plugins

```bash
# Inside Neovim
:Lazy update
```

### Update LazyVim

```bash
# Inside Neovim  
:LazyHealth
:Lazy update LazyVim
```

## 🐛 Troubleshooting

### Plugin Issues

1. Check plugin health:

   ```bash
   :checkhealth
   ```

2. Clear plugin cache:

   ```bash
   :Lazy clear
   ```

3. Reinstall plugins:

   ```bash
   :Lazy restore
   ```

### LSP Issues

1. Check LSP status:

   ```bash
   :LspInfo
   ```

2. Restart LSP server:

   ```bash
   :LspRestart
   ```

### Performance Issues

1. Profile startup time:

   ```bash
   nvim --startuptime startup.log
   ```

2. Check plugin load times:

   ```bash
   :Lazy profile
   ```

## 📚 Resources

- [LazyVim Documentation](https://lazyvim.github.io/)
- [Lazy.nvim Documentation](https://github.com/folke/lazy.nvim)
- [Neovim Documentation](https://neovim.io/doc/)

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📄 License

This configuration is available under the MIT License. See the LICENSE file for more details.
