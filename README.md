# MacOS setup 🛠

Repo containing a list of all my most used macOS apps and settings.

## Apps/tools

| Name               | Brew name          | Description                  | Link                                                 |
| ------------------ | ------------------ | ---------------------------- | ---------------------------------------------------- |
| iTerm2             | iterm2             | Terminal                     | https://iterm2.com/                                  |
| Oh My Zsh          | oh-my-zsh          | Zsh configuration manager    | https://ohmyz.sh/                                    |
| Git                | git                | Version control              | https://git-scm.com/                                 |
| Github desktop     | github             | Github desktop application   | https://desktop.github.com/                          |
| Rider              | rider              | Cross-Platform .NET IDE      | https://www.jetbrains.com/rider/                     |
| Visual Studio Code | visual-studio-code | Lightweight code editor      | https://code.visualstudio.com/                       |
| Nvm                | nvm                | Node.js version manager      | https://github.com/nvm-sh/nvm                        |
| Node.js            | node               | JavaScript runtime           | https://nodejs.org/en/                               |
| .NET               | dotnet             | .NET runtime                 | https://dotnet.microsoft.com/en-us/                  |
| Postman            | postman            | API platform                 | https://www.postman.com/                             |
| Google Chrome      | google-chrome      | Web browser                  | https://www.google.com/intl/no/chrome/               |
| Slack              | slack              | Communication platform       | https://slack.com/                                   |
| Spotify            | spotify            | Music player                 | https://www.spotify.com/                             |
| Iina               | iina               | Media player                 | https://iina.io/                                     |
| 1Password          | 1password          | Password manager             | https://1password.com/                               |
| CheatSheet         | cheatsheet         | List all available shortcuts | https://www.mediaatelier.com/CheatSheet/             |
| AltTab             | alt-tab            | Windows alt-tab on macOS     | https://alt-tab-macos.netlify.app/                   |
| Magnet             | N/A                | Window manager               | https://magnet.crowdcafe.com/                        |
| Vectornator        | N/A                | Graphic design software      | https://www.vectornator.io/                          |
| Logi Options       | N/A                | Logitech preferences tool    | https://www.logitech.com/no-no/software/options.html |

## Settings

### VS Code

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
    "source.fixAll": true,
    "source.sortImports": true
  },
  "files.autoSave": "onFocusChange",
  "workbench.colorTheme": "Andromeda",
  "workbench.iconTheme": "material-icon-theme",
  "workbench.productIconTheme": "fluent-icons",
  "settingsSync.ignoredExtensions": ["zixuanchen.vitest-explorer"],
  "prettier.endOfLine": "auto",
  "eslint.enable": true,
  "eslint.validate": ["react", "typescript", "html", "javascript"],
  "javascript.preferences.quoteStyle": "double",
  "javascript.updateImportsOnFileMove.enabled": "always",
  "javascript.suggest.autoImports": true,
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
  }
}
```

### VS Extensions

```json
{
  "recommendations": [
    "dbaeumer.vscode-eslint", // ES Lint
    "esbenp.prettier-vscode", // Prettier
    "zixuanchen.vitest-explorer", // Vitest explorer
    "formulahendry.auto-rename-tag", // Auto rename tag
    "github.github-vscode-theme", // Github theme
    "eliverlara.andromeda", // Andromeda theme
    "equinusocio.vsc-material-theme", // Material theme
    "akamud.vscode-theme-onedark", // Atom One Dark theme
    "miguelsolorio.fluent-icons", // Product icon theme
    "pkief.material-icon-theme", // Icon theme
    "yzhang.markdown-all-in-one" // Markdown extension
  ]
}
```

### Rider settings

- Theme: Material Theme UI

### iTerm2 setting

- Appearance
  - Theme
    - Minimal
- Profiles
  - Default
    - General -> Working Directory -> Reuse previous session's directory
    - Keys -> Key Mappings -> Presets -> Natural Text Editing

### Logi options setting

TODO: Insert

### Finder settings

- Finder -> Preferences
  - General -> Show these on the desktop -> Select None
  - General -> New Finder windows show -> Home Folder
  - Advanced -> Show all filename extensions -> Yes
  - Advanced -> Show warning before changing an extension -> No
  - Advanced -> When performing a search -> Search the current folder
- View
  - Show Status Bar
  - Show Path Bar
  - Show Tab Bar

### System Preferences

- General
  - Appearance --> Dark
  - Allow wallpaper tinting in Windows -> Yes
  - Allow Handoff between this Mac and your iCloud devices -> Yes
- Dock & Menu Bar
  - Dock & Menu Bar: Size -> ~ 25%
  - Dock & Menu Bar: Magnification -> No
  - Dock & Menu Bar: Position on screen -> Left
  - Dock & Menu Bar: Automatically hide and show the Dock -> No
  - Dock & Menu Bar: Show recent applications in Dock -> No
  - Battery: Show percentage -> Yes
- Trackpad
  - Tracking speed -> ~ 75%
  - Scroll direction -> Natural
- Display
  - Resolution -> Scaled & More Space

## Chrome extensions

- [AdBlock](https://chrome.google.com/webstore/detail/adblock-%E2%80%94-best-ad-blocker/gighmmpiobklfepjocnamgkkbiglidom)
- [1Password](https://chrome.google.com/webstore/detail/1password-%E2%80%93-password-mana/aeblfdkhhhdcdjpifhhbdiojplfjncoa)
- [React Developer Tools](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi)
