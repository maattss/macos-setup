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
├── install.sh              # Main installation script (runs `brew bundle`)
├── Brewfile                # Declarative list of brews and casks to install
├── scripts/
│   ├── git-setup.sh        # Git configuration and SSH setup
│   └── macos-settings.sh   # macOS system preferences
├── CLAUDE.md               # Global Claude Code instructions
├── settings.json           # Global Claude Code settings (permissions, plugins)
├── skills/                 # Claude Code skills
│   ├── clean-worktrees/    # /clean-worktrees — remove non-main git worktrees
│   ├── plan-issues/        # /plan-issues — triage open GitHub issues
│   └── review-pr/          # /review-pr — senior design review of a PR
└── README.md
```

## 📦 What Gets Installed

> The actual list lives in [`Brewfile`](Brewfile) — `install.sh` runs `brew bundle` against it. Add or remove apps there. Use `brew bundle dump --force --file=Brewfile` to snapshot what's currently installed.



### CLI Tools
| Tool | Description |
|------|-------------|
| `git` | Version control |
| `gh` | GitHub CLI |
| `node` | Node.js runtime |
| `nvm` | Node Version Manager |
| `pnpm` | Fast package manager |
| `jq` | JSON processor |
| `tree` | Directory listing |
| `wget` | File downloader |
| `httpie` | HTTP client |

### Development Applications
| App | Description |
|-----|-------------|
| Docker | Containerization |
| Warp | Modern terminal |
| GitHub Desktop | Git GUI |
| VS Code | Code editor |
| Rider | .NET IDE |
| .NET SDK | .NET development |
| Bruno | API client |

### Productivity
| App | Description |
|-----|-------------|
| Slack | Team communication |
| Raycast | Productivity launcher |
| Alt-Tab | Window switcher |
| Dropbox | Cloud storage |
| Notion | Notes & docs |

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

## 🔧 Manual Installations Required

These apps need to be installed manually:
- **Magnet** - Window manager (Mac App Store)
- **Logi Options** - Logitech mouse/keyboard settings

## ⚙️ VS Code Settings

After installation, install the 'code' command in PATH:
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

### Keyboard & Trackpad
- Fast key repeat
- Tap to click enabled
- Three finger drag enabled
- Disable auto-correct

### Other
- Dark mode
- Screenshots saved to `~/Pictures/Screenshots` as PNG
- Safari developer tools enabled

## 🔑 Git Setup

The `scripts/git-setup.sh` script configures:

- Git user name and email
- Default branch name (`main`)
- Useful aliases (`st`, `co`, `br`, `ci`, `lg`, `amend`, `undo`)
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

3. **Configure NVM** - Add to `~/.zshrc`:
   ```bash
   export NVM_DIR="$HOME/.nvm"
   [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
   ```

4. **Restart your Mac** for all macOS settings to take effect

## 🤖 Claude Code Setup

Global config for [Claude Code](https://claude.com/claude-code) — instructions, permissions, and skills used across all projects.

### What's included

- **[CLAUDE.md](CLAUDE.md)** — Global instructions. Communication style (direct, no sycophancy), code standards (native APIs, no hacks, a11y), package management (pnpm only, no npx, manual approval for new deps).
- **[settings.json](settings.json)** — Global permissions and plugins. Broad allow for `git`, `gh`, `pnpm`, `dotnet` + shell utilities. Hard deny on `npx` and `gh repo delete`. Ask-every-time for package install/add/remove and PR merge/close. Atlassian and Splash UI MCP tools auto-allowed.
- **Skills** (under `skills/`) — copy to `~/.claude/skills/` to make them available globally:
  - **[review-pr](skills/review-pr/SKILL.md)** — Senior engineer design review of a PR. Evaluates the approach, not the code style. Posts review as a GitHub comment, fetches Jira context if linked, refuses to review PRs with no description. `/review-pr <number>`
  - **[plan-issues](skills/plan-issues/SKILL.md)** — Analyzes open GitHub issues and creates a prioritized implementation plan. Groups related issues, identifies quick wins and blockers, estimates scope by reading actual code. `/plan-issues [max]`
  - **[clean-worktrees](skills/clean-worktrees/SKILL.md)** — Removes all git worktrees except the main working tree. `/clean-worktrees`

### Install

```bash
# Skills
mkdir -p ~/.claude/skills
cp -r skills/* ~/.claude/skills/

# Settings and instructions — merge manually, don't overwrite
# Your existing ~/.claude/settings.json may have other config you want to keep
```

## 🤝 Contributing

Feel free to fork and customize for your own setup!

## 📄 License

MIT
