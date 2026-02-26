# macOS Setup 🛠

Automated setup scripts for a fresh macOS installation. Get your Mac ready for development in minutes!

## 🚀 Quick Start

```bash
# Clone the repository
git clone https://github.com/maattss/macos-setup.git
cd macos-setup

# Make scripts executable
chmod +x install.sh scripts/*.sh

# Run the main installation script
./install.sh

# Configure macOS settings (optional)
./scripts/macos-settings.sh

# Set up Git and SSH (optional)
./scripts/git-setup.sh
```

## 📁 Repository Structure

```
macos-setup/
├── install.sh              # Main installation script
├── scripts/
│   ├── git-setup.sh        # Git configuration and SSH setup
│   └── macos-settings.sh   # macOS system preferences
└── README.md
```

## 📦 What Gets Installed

### CLI Tools
| Tool | Description |
|------|-------------|
| `git` | Version control |
| `gh` | GitHub CLI |
| `node` | Node.js runtime |
| `bun` | Fast JavaScript runtime & toolkit |
| `mise` | Polyglot version manager (Node, Python, Ruby, …) |
| `pnpm` | Fast package manager |
| `jq` | JSON processor |
| `tree` | Directory listing |
| `wget` | File downloader |
| `httpie` | HTTP client |
| `bat` | `cat` with syntax highlighting |
| `eza` | Modern `ls` replacement |
| `ripgrep` | Fast `grep` replacement |
| `fd` | Fast `find` replacement |
| `fzf` | Fuzzy finder |
| `zoxide` | Smarter `cd` |
| `lazygit` | Terminal UI for Git |

### Development Applications
| App | Description |
|-----|-------------|
| OrbStack | Fast, lightweight Docker & Linux VMs |
| Ghostty | Modern GPU-accelerated terminal |
| Warp | Modern AI-powered terminal |
| GitHub Desktop | Git GUI |
| VS Code | Code editor |
| Cursor | AI-first code editor |
| Rider | .NET IDE |
| .NET SDK | .NET development |
| Bruno | Open-source API client |

### Productivity
| App | Description |
|-----|-------------|
| Slack | Team communication |
| Raycast | Productivity launcher |
| Alt-Tab | Window switcher |

### Media & Browsers
| App | Description |
|-----|-------------|
| Zen Browser | Privacy-focused browser |
| Spotify | Music streaming |
| IINA | Video player |

### Shell Enhancements
- **Oh My Zsh** - Zsh framework
- **zsh-autosuggestions** - Command suggestions
- **zsh-syntax-highlighting** - Syntax highlighting

### AI Tools
- **GitHub Copilot CLI** (`gh copilot`) - AI suggestions in the terminal

## 🔧 Manual Installations Required

These apps need to be installed manually:
- **Magnet** - Window manager (Mac App Store)
- **Logi Options+** - Logitech mouse/keyboard settings

## ⚙️ VS Code / Cursor Settings

After installation, install the `code` command in PATH (VS Code only):
1. Open VS Code
2. Press `Cmd+Shift+P`
3. Type "Shell Command: Install 'code' command in PATH"

### Recommended settings.json

```json
{
  "search.exclude": {
    "**/node_modules": true
  },
  "editor.minimap.enabled": false,
  "editor.formatOnSave": true,
  "editor.inlineSuggest.enabled": true,
  "editor.snippetSuggestions": "top",
  "editor.codeActionsOnSave": {
    "source.fixAll": "explicit",
    "source.sortImports": "explicit"
  },
  "files.autoSave": "onFocusChange",
  "workbench.colorTheme": "Andromeda",
  "workbench.iconTheme": "material-icon-theme",
  "workbench.productIconTheme": "fluent-icons",
  "prettier.endOfLine": "auto",
  "eslint.enable": true,
  "eslint.validate": ["react", "typescript", "html", "javascript"],
  "javascript.preferences.quoteStyle": "double",
  "javascript.updateImportsOnFileMove.enabled": "always",
  "typescript.updateImportsOnFileMove.enabled": "always",
  "[typescript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[typescriptreact]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[javascriptreact]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[html]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[css]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[scss]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[json]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[jsonc]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[markdown]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "eslint.workingDirectories": [{ "mode": "auto" }]
}
```

### Recommended Extensions

Create `.vscode/extensions.json` in your projects:

```json
{
  "recommendations": [
    "dbaeumer.vscode-eslint",
    "esbenp.prettier-vscode",
    "formulahendry.auto-rename-tag",
    "eliverlara.andromeda",
    "miguelsolorio.fluent-icons",
    "pkief.material-icon-theme",
    "yzhang.markdown-all-in-one",
    "github.copilot",
    "github.copilot-chat"
  ]
}
```

## 🖥️ macOS Settings

The `scripts/macos-settings.sh` script configures:

### Finder
- Show all filename extensions
- Show status bar and path bar
- Search current folder by default
- Use list view by default
- New windows open to home folder

### Dock
- Position: Left
- Size: Small (36px)
- No magnification
- Don't show recent applications
- Stage Manager disabled

### Keyboard & Trackpad
- Fast key repeat
- Tap to click enabled
- Three finger drag enabled
- Disable auto-correct

### Other
- Dark mode
- Siri disabled
- Screenshots saved to `~/Pictures/Screenshots` as PNG
- Safari developer tools enabled

## 🔑 Git Setup

The `scripts/git-setup.sh` script configures:

- Git user name and email
- Default branch name (`main`)
- Useful aliases (`st`, `co`, `sw`, `br`, `ci`, `rs`, `lg`, `amend`, `undo`)
- Global gitignore
- SSH key generation
- GitHub CLI authentication
- Automatic SSH key upload to GitHub

## 📝 Post-Installation

After running the scripts:

1. **Restart terminal** or run `source ~/.zshrc`

2. **Add Zsh plugins** to `~/.zshrc`:
   ```bash
   plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
   ```

3. **Configure mise and zoxide** — add to `~/.zshrc`:
   ```bash
   eval "$(mise activate zsh)"
   eval "$(zoxide init zsh)"
   ```

4. **Restart your Mac** for all macOS settings to take effect

## 🤝 Contributing

Feel free to fork and customize for your own setup!

## 📄 License

MIT
