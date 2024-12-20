# MacOS setup 🛠

Repo containing a list of all my most used macOS apps and settings.

## Apps/tools

> See `install.sh`

## VS Code settings

Shell Command: Install 'code' command in PATH

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
  },
  "eslint.workingDirectories": [{ "mode": "auto" }]
}
```

## VS Code Extensions

```json
{
  "recommendations": [
    "dbaeumer.vscode-eslint", // ES Lint
    "esbenp.prettier-vscode", // Prettier
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
- Keymap: Visual Studio (macOS) 

## iTerm2 setting

- Appearance
  - Theme
    - Minimal
- Profiles
  - Default
    - General -> Working Directory -> Reuse previous session's directory
    - Keys -> Key Mappings -> Presets -> Natural Text Editing

## Finder settings

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

## System Preferences

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
- [JSON Formatter](https://chrome.google.com/webstore/detail/json-formatter/bcjindcccaagfpapjjmafapmmgkkhgoa)
