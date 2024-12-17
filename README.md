# ✨ My Mac setup!!!

## 🖼️ Image

<img width="1440" alt="dotfiles" src="https://github.com/user-attachments/assets/b5ae2058-ea15-43c3-9826-64da447b5a09" />


## 📦 Installation

### Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Dependencies

```bash
xcode-select --install
brew install --cask wezterm
brew install neovim
brew install ripgrep
brew install fzf
brew install starship # command line prompt
brew install stow     # dotfiles manager
brew install neofetch
brew install jq
brew install gradle
```

### Git

```bash
brew install git
brew install git-lfs  # git large file storage
brew install git-filter-repo
brew install lazygit
brew install gh       # github cli

# github cli authenticate to link with devices
gh auth login
```

### Tmux

```bash
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# ctrl + I to install all plugins
```

### Window Manager & SketchyBar

```bash
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd

brew tap FelixKratz/formulae
brew install sketchybar
```

### Fonts

```bash
brew tap epk/epk      # SFMono-Nerd-Font
brew install font-sf-mono-nerd-font

brew install --cask font-sf-pro

# SketchyBar usage
brew install --cask sf-symbols
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.28/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf
# go to sketchybar-app-font github to get the latest release
```

### Mac Utils

```bash
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false # repeating key
defaults write com.apple.dock autohide-time-modifier -float 0.15; killall Dock # show the dock faster
```

## 🚀 Stow Usage

```bash
cd ~/dotfiles
stow "directory"

stow --restow "directory" # for restowing
```

## 🛠️ Developer tools

- Arc (web browser)
- Wezterm
- VsCode
- Docker Desktop
- Postman
- Anaconda
- MacTex
  - [MacTex download page](https://tug.org/mactex/)

## 💧 Utility apps

- RayCast
- AltTab
- Obsidian
- AlDente
- Monitor Control
- Mac Mouse Fix
- Logitech G HUB
- Sioyek
- AppCleaner
