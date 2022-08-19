# Mac setup 🛠

Repo containing a list of my macOS apps and settings as well as a script for installing all apps on new computers.

## Apps/tools

| Name               | Brew name          | Description                | Link                                   |
| ------------------ | ------------------ | -------------------------- | -------------------------------------- |
| iTerm2             | iterm2             | Terminal                   | https://iterm2.com/                    |
| Oh My Zsh          | oh-my-zsh          | Zsh configuration manager  | https://ohmyz.sh/                      |
| Git                | git                | Version control            | https://git-scm.com/                   |
| Github desktop     | github             | Github desktop application | https://desktop.github.com/            |
| Rider              | rider              | Cross-Platform .NET IDE    | https://www.jetbrains.com/rider/       |
| Visual Studio Code | visual-studio-code | Lightweight code editor    | https://code.visualstudio.com/         |
| Sublime Text       | sublime-text       | Text editor                | https://www.sublimetext.com/           |
| Nvm                | nvm                | Node.js version manager    | https://github.com/nvm-sh/nvm          |
| Node.js            | node               | JavaScript runtime         | https://nodejs.org/en/                 |
| Magnet             | N/A                | Window manager             | https://magnet.crowdcafe.com/          |
| AltTab             | alt-tab            | Windows alt-tab on macOS   | https://alt-tab-macos.netlify.app/     |
| Postman            | postman            | API platform               | https://www.postman.com/               |
| Google Chrome      | google-chrome      | Web browser                | https://www.google.com/intl/no/chrome/ |
| Slack              | slack              | Communication platform     | https://slack.com/                     |
| Spotify            | spotify            | Music player               | https://www.spotify.com/               |
| Iina               | iina               | Media player               | https://iina.io/                       |

## Settings

### VS Code

```json
{
  "editor.minimap.enabled": false,
  "editor.formatOnSave": true,
  "editor.inlineSuggest.enabled": true,
  "editor.codeActionsOnSave": {
    "source.fixAll": true,
    "source.sortImports": true
  },

  "files.autoSave": "onFocusChange",
  "workbench.colorTheme": "Andromeda",
  "workbench.iconTheme": "material-icon-theme",
  "workbench.productIconTheme": "fluent-icons",
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
  "[json]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "prettier.endOfLine": "auto",
  "settingsSync.ignoredExtensions": ["zixuanchen.vitest-explorer"]
}
```

### VS Code Extension

```json
{
  "recommendations": [
    "eliverlara.andromeda",
    "formulahendry.auto-rename-tag",
    "miguelsolorio.fluent-icons",
    "pkief.material-icon-theme",
    "dbaeumer.vscode-eslint",
    "esbenp.prettier-vscode",
    "k--kato.intellij-idea-keybindings"
  ]
}
```

### Rider settings

### iTerm2 settings
