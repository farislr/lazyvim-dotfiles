# Personal Neovim Configuration

A LazyVim-based Neovim configuration optimized for personal development workflow with Go, JSON, and Markdown support.

## Installation

### Prerequisites

Install the following dependencies before setting up this configuration:

```bash
# On Arch Linux/Manjaro
sudo pacman -S neovim git ripgrep fd nodejs npm go

# On Ubuntu/Debian
sudo apt update
sudo apt install neovim git ripgrep fd-find nodejs npm golang-go

# On macOS
brew install neovim git ripgrep fd node go
```

**Required versions:**
- Neovim ≥ 0.9.0 (built with LuaJIT)
- Git ≥ 2.19.0
- Node.js (for LSP servers)
- Go toolchain (for Go development)

**Optional but recommended:**
- A Nerd Font for icons (install via https://www.nerdfonts.com/)
- Terminal with true color support

### Installation Steps

1. **Backup existing configuration:**
```bash
# Create backup directory
mkdir -p ~/.config/nvim-backups/$(date +%Y%m%d_%H%M%S)

# Backup all Neovim data
mv ~/.config/nvim ~/.config/nvim-backups/$(date +%Y%m%d_%H%M%S)/config 2>/dev/null || true
mv ~/.local/share/nvim ~/.config/nvim-backups/$(date +%Y%m%d_%H%M%S)/share 2>/dev/null || true
mv ~/.local/state/nvim ~/.config/nvim-backups/$(date +%Y%m%d_%H%M%S)/state 2>/dev/null || true
mv ~/.cache/nvim ~/.config/nvim-backups/$(date +%Y%m%d_%H%M%S)/cache 2>/dev/null || true
```

2. **Clone this configuration:**
```bash
git clone <your-repo-url> ~/.config/nvim
```

3. **Start Neovim and wait for automatic setup:**
```bash
nvim
```

The first startup will automatically:
- Install lazy.nvim plugin manager
- Download and install all plugins
- Set up LSP servers via Mason
- Configure everything according to your settings

## Keymap Configuration

### Understanding the Keymap System

This configuration uses LazyVim's keymap system with `<space>` as the leader key. Keymaps are defined in multiple layers:

1. **LazyVim defaults** - Built-in keymaps from LazyVim
2. **Plugin-specific keymaps** - Automatically configured by plugins
3. **Custom keymaps** - Your personal modifications in `lua/config/keymaps.lua`

### Essential Default Keymaps

#### File Operations
```
<leader>ff    - Find files (telescope)
<leader>fg    - Live grep search
<leader>fb    - Browse open buffers
<leader>fr    - Recent files
<leader>fn    - New file
<leader>w     - Save file
<leader>q     - Quit
<leader>qq    - Quit all
```

#### Navigation
```
<C-h>         - Move to left window
<C-j>         - Move to bottom window
<C-k>         - Move to top window
<C-l>         - Move to right window
<C-u>         - Scroll up half page
<C-d>         - Scroll down half page
gd            - Go to definition
gr            - Go to references
gi            - Go to implementation
K             - Show hover documentation
```

#### Code Operations
```
<leader>ca    - Code actions
<leader>cr    - Rename symbol
<leader>cf    - Format code
<leader>cd    - Line diagnostics
<leader>cl    - Show diagnostics in location list
gcc           - Comment/uncomment line
gc            - Comment/uncomment selection (visual mode)
```

#### Testing (neotest)
```
<leader>tt    - Run nearest test
<leader>tT    - Run all tests in file
<leader>ts    - Toggle test summary
<leader>to    - Show test output
<leader>tO    - Output panel
```

#### Git Integration
```
<leader>gg    - LazyGit
<leader>gb    - Git blame line
<leader>gf    - Git file history
]h            - Next git hunk
[h            - Previous git hunk
<leader>ghs   - Stage hunk
<leader>ghu   - Unstage hunk
<leader>ghr   - Reset hunk
```

### Custom Keymap Examples

Add your custom keymaps to `lua/config/keymaps.lua`:

```lua
-- lua/config/keymaps.lua
local map = vim.keymap.set

-- Quick save with Ctrl+S
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Better window navigation
map("n", "<C-Left>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-Right>", "<C-w>l", { desc = "Go to right window" })
map("n", "<C-Up>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-Down>", "<C-w>j", { desc = "Go to lower window" })

-- Move lines up/down
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- Better indenting in visual mode
map("v", "<", "<gv", { desc = "Unindent line" })
map("v", ">", ">gv", { desc = "Indent line" })

-- Quick access to config files
map("n", "<leader>fc", function()
  require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find config files" })

-- Toggle relative line numbers
map("n", "<leader>tn", function()
  vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = "Toggle relative numbers" })

-- Custom text objects for function arguments
map({ "o", "x" }, "ia", "<cmd>lua require('mini.ai').select_textobject('a', 'i')<cr>", { desc = "Select argument" })
map({ "o", "x" }, "aa", "<cmd>lua require('mini.ai').select_textobject('a', 'a')<cr>", { desc = "Select argument" })
```

### Plugin-Specific Keymap Configuration

#### Customizing Telescope
```lua
-- lua/plugins/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- Override default find files
    { "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find files (including hidden)" },
    -- Add custom file search in specific directory
    { "<leader>fp", function()
        require("telescope.builtin").find_files({ cwd = "~/projects" })
      end, desc = "Find files in projects" },
  },
  opts = {
    defaults = {
      -- Custom key mappings within telescope
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
          ["<C-q>"] = "send_to_qflist",
        },
      },
    },
  },
}
```

#### Neo-tree Custom Keys
```lua
-- lua/plugins/neo-tree.lua
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = {
        -- Custom mappings for neo-tree
        ["<space>"] = "none", -- Remove default space mapping
        ["v"] = "open_vsplit",
        ["s"] = "open_split",
        ["t"] = "open_tabnew",
        ["P"] = "toggle_preview",
      },
    },
  },
}
```

### Keymap Discovery

#### View All Available Keymaps
```
<leader>sk    - Search keymaps (telescope)
<leader>?     - Show which-key help
```

#### Check Specific Key Binding
```vim
:verbose map <key>    " Shows what key is mapped to
:nmap                 " Show normal mode mappings
:imap                 " Show insert mode mappings
:vmap                 " Show visual mode mappings
```

## Backup and Restoration

### Complete Backup Procedure

#### 1. Automated Backup Script

Create a backup script at `~/.local/bin/nvim-backup`:

```bash
#!/bin/bash
# nvim-backup - Complete Neovim configuration backup

BACKUP_DIR="$HOME/.config/nvim-backups/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

echo "Creating Neovim backup at: $BACKUP_DIR"

# Backup configuration files
if [ -d "$HOME/.config/nvim" ]; then
    echo "Backing up configuration..."
    cp -r "$HOME/.config/nvim" "$BACKUP_DIR/config"
fi

# Backup plugin data
if [ -d "$HOME/.local/share/nvim" ]; then
    echo "Backing up plugin data..."
    cp -r "$HOME/.local/share/nvim" "$BACKUP_DIR/share"
fi

# Backup state (sessions, etc.)
if [ -d "$HOME/.local/state/nvim" ]; then
    echo "Backing up state..."
    cp -r "$HOME/.local/state/nvim" "$BACKUP_DIR/state"
fi

# Backup cache
if [ -d "$HOME/.cache/nvim" ]; then
    echo "Backing up cache..."
    cp -r "$HOME/.cache/nvim" "$BACKUP_DIR/cache"
fi

# Create backup info file
cat > "$BACKUP_DIR/backup_info.txt" << EOF
Backup created: $(date)
Neovim version: $(nvim --version | head -1)
System: $(uname -a)
Git commit: $(cd ~/.config/nvim && git rev-parse HEAD 2>/dev/null || echo "Not a git repository")
EOF

echo "Backup completed successfully!"
echo "Location: $BACKUP_DIR"
```

Make it executable:
```bash
chmod +x ~/.local/bin/nvim-backup
```

#### 2. Manual Backup Commands

```bash
# Create timestamped backup directory
BACKUP_DIR=~/.config/nvim-backups/$(date +%Y%m%d_%H%M%S)
mkdir -p "$BACKUP_DIR"

# Backup all Neovim directories
cp -r ~/.config/nvim "$BACKUP_DIR/config" 2>/dev/null || true
cp -r ~/.local/share/nvim "$BACKUP_DIR/share" 2>/dev/null || true
cp -r ~/.local/state/nvim "$BACKUP_DIR/state" 2>/dev/null || true
cp -r ~/.cache/nvim "$BACKUP_DIR/cache" 2>/dev/null || true

# Backup important system files
cp ~/.bashrc "$BACKUP_DIR/bashrc" 2>/dev/null || true
cp ~/.zshrc "$BACKUP_DIR/zshrc" 2>/dev/null || true

echo "Backup completed: $BACKUP_DIR"
```

#### 3. Configuration-Only Backup

For quick config backups:

```bash
# Backup just the configuration
cd ~/.config/nvim
git add . && git commit -m "Backup: $(date)"

# Or create tar archive
tar czf ~/nvim-config-$(date +%Y%m%d_%H%M%S).tar.gz ~/.config/nvim
```

### Restoration Procedures

#### 1. Full System Restoration

```bash
# Set backup directory path
BACKUP_DIR="/path/to/your/backup/directory"

# Stop any running Neovim instances
pkill nvim

# Remove current installation
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

# Restore from backup
cp -r "$BACKUP_DIR/config" ~/.config/nvim
cp -r "$BACKUP_DIR/share" ~/.local/share/nvim
cp -r "$BACKUP_DIR/state" ~/.local/state/nvim
cp -r "$BACKUP_DIR/cache" ~/.cache/nvim

# Verify restoration
nvim --version
echo "Restoration completed!"
```

#### 2. Selective Restoration

Restore only specific components:

```bash
BACKUP_DIR="/path/to/your/backup"

# Restore only configuration (preserves installed plugins)
cp -r "$BACKUP_DIR/config/"* ~/.config/nvim/

# Restore only keymaps
cp "$BACKUP_DIR/config/lua/config/keymaps.lua" ~/.config/nvim/lua/config/

# Restore only plugins configuration
cp -r "$BACKUP_DIR/config/lua/plugins/"* ~/.config/nvim/lua/plugins/

# Restore plugin lockfile (exact plugin versions)
cp "$BACKUP_DIR/config/lazy-lock.json" ~/.config/nvim/
```

#### 3. Git-Based Restoration

If your config is in a git repository:

```bash
# Clone from your repository
git clone <your-repo-url> ~/.config/nvim

# Or reset to a specific commit
cd ~/.config/nvim
git reset --hard <commit-hash>

# Restore plugins
nvim --headless -c "Lazy! restore" -c "qa"
```

### Automated Backup Strategy

#### 1. Daily Cron Job

Add to crontab (`crontab -e`):
```bash
# Daily Neovim backup at 2 AM
0 2 * * * /home/yourusername/.local/bin/nvim-backup >/dev/null 2>&1

# Weekly cleanup of old backups (keep last 4 weeks)
0 3 * * 0 find ~/.config/nvim-backups -type d -mtime +28 -exec rm -rf {} + 2>/dev/null
```

#### 2. Pre-Update Hook

Create `~/.config/nvim/pre-update-backup.sh`:
```bash
#!/bin/bash
# Run before updating plugins
echo "Creating pre-update backup..."
~/.local/bin/nvim-backup
echo "Backup completed. Proceeding with update..."
```

#### 3. Git Hooks

If using git for your config:
```bash
# ~/.config/nvim/.git/hooks/pre-commit
#!/bin/bash
echo "Auto-backup before commit..."
cp lazy-lock.json "lazy-lock.json.backup.$(date +%Y%m%d_%H%M%S)"
```

### Recovery Verification

After any restoration:

```bash
# Check Neovim starts correctly
nvim --version

# Verify plugin installation
nvim --headless -c "Lazy! check" -c "qa"

# Test key functionality
nvim +checkhealth

# Verify LSP servers
nvim -c "LspInfo" some_file.lua
```

### Emergency Recovery

If Neovim won't start:

```bash
# Start with minimal config
nvim --clean

# Or start without plugins
nvim --noplugin

# Check for syntax errors in config
nvim --headless -c "luafile ~/.config/nvim/init.lua" -c "qa"

# Reset to working state
cd ~/.config/nvim
git reset --hard HEAD~1  # Go back one commit
```

This comprehensive backup and restoration system ensures you can always recover your exact working environment, whether dealing with failed updates, system crashes, or when setting up Neovim on new machines.