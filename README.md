# Personal LazyVim Configuration

A simple LazyVim-based Neovim configuration for development with Go, JSON, and Markdown support.

## Quick Start

### Prerequisites

Install these dependencies:

```bash
# Arch Linux/Manjaro
sudo pacman -S neovim git ripgrep fd nodejs npm

# Ubuntu/Debian  
sudo apt install neovim git ripgrep fd-find nodejs npm

# macOS
brew install neovim git ripgrep fd node
```

**Requirements:**
- Neovim ≥ 0.9.0
- Git ≥ 2.19.0
- Node.js (for LSP servers)

### Installation

1. **Backup existing config:**
```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

2. **Clone and start:**
```bash
git clone https://github.com/farislr/lazyvim-dotfiles.git ~/.config/nvim
nvim
```

That's it! The first startup will automatically install all plugins and LSP servers.

## Essential Keybindings

**Leader key:** `<space>`

### File Operations
- `<leader>ff` - Find files
- `<leader>fg` - Search in files  
- `<leader>fb` - Browse buffers
- `<leader>w` - Save file
- `<leader>q` - Quit

### Navigation
- `<C-h/j/k/l>` - Move between windows
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Show documentation

### Code
- `<leader>ca` - Code actions
- `<leader>cr` - Rename symbol
- `<leader>cf` - Format code
- `gcc` - Comment line

### Git
- `<leader>gg` - Open LazyGit
- `]h` / `[h` - Next/previous git hunk

### Discovery
- `<leader>sk` - Search all keymaps
- `<leader>?` - Show which-key help

## Customization

Edit files in `lua/config/` and `lua/plugins/` to customize your setup.

## Backup & Restore

**Quick backup:**
```bash
cp -r ~/.config/nvim ~/nvim-backup-$(date +%Y%m%d)
```

**Restore:**
```bash
rm -rf ~/.config/nvim
cp -r ~/nvim-backup-20231201 ~/.config/nvim
```