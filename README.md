# macOS Setup 🛠

Automated setup for a fresh macOS installation. One command gets you from a blank Mac to a development-ready machine.

## 🚀 Quick Start

```bash
git clone https://github.com/maattss/macos-setup.git
cd macos-setup
chmod +x install.sh scripts/*.sh
./install.sh
```

That's it. The installer runs everything in order:

1. Xcode Command Line Tools
2. Homebrew + every package in [`Brewfile`](Brewfile)
3. Oh My Zsh + plugins, with `~/.zshrc` updated automatically
4. NVM init lines appended to `~/.zshrc`
5. `~/Developer` folder
6. macOS system preferences (interactive — needs sudo)

### Skip optional steps

```bash
./install.sh --skip-macos     # skip macOS system preferences
```

## 📁 Repository Structure

```
macos-setup/
├── install.sh              # Main installer — runs everything
├── Brewfile                # Declarative list of brews, casks, and Mac App Store apps
├── scripts/
│   └── macos-settings.sh   # macOS system preferences (Finder, Dock, keyboard, etc.)
├── CLAUDE.md               # Global Claude Code instructions
├── settings.json           # Global Claude Code settings (permissions, plugins)
├── skills/                 # Claude Code skills (copy to ~/.claude/skills/)
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
| `mas` | Mac App Store CLI |
| `azure-cli` | Azure command-line |
| `poetry` | Python dependency management |
| `supabase` | Supabase CLI |

### Development Applications
| App | Description |
|-----|-------------|
| Docker | Containerization |
| Warp | Modern terminal |
| iTerm2 | Terminal |
| GitHub Desktop | Git GUI |
| VS Code | Code editor |
| .NET SDK | .NET development |
| Bruno | API client |
| Claude Code | AI coding assistant |
| Codex | AI coding assistant |

### Productivity
| App | Description |
|-----|-------------|
| Slack | Team communication |
| Dropbox | Cloud storage |
| Notion | Notes & docs |
| DockDoor | Window peeking from the Dock |
| Magnet | Window manager (via Mac App Store) |

### Media & Browsers
| App | Description |
|-----|-------------|
| Google Chrome | Browser |
| Spotify | Music streaming |
| IINA | Video player |

### Shell Enhancements
- **Oh My Zsh** with `git`, `zsh-autosuggestions`, and `zsh-syntax-highlighting` enabled automatically
- **NVM** init lines added to `~/.zshrc` automatically

## 🔑 Mac App Store

Apps installed via `mas` require you to be signed in to the App Store first. Open the App Store app, sign in, then re-run `./install.sh` — already-installed brews/casks are skipped.

## 🖥️ macOS Settings

`scripts/macos-settings.sh` configures:

**Finder** — show extensions, status bar, path bar; search current folder; list view; open to home folder
**Dock** — left side, 36px, no magnification, no recent apps, fast animations
**Keyboard & Trackpad** — fast key repeat, tap to click, three-finger drag, no auto-correct
**Other** — dark mode, screenshots to `~/Pictures/Screenshots` as PNG, Safari developer tools

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
mkdir -p ~/.claude/skills
cp -r skills/* ~/.claude/skills/

# CLAUDE.md and settings.json — merge manually into ~/.claude/, don't overwrite
# (your existing config may have other settings worth keeping)
```

## 🤝 Contributing

Fork and customize for your own setup.

## 📄 License

MIT
