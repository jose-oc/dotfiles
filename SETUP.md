# New Mac setup

## 1. Install Homebrew

Follow the Homebrew install instructions.

## 2. Install chezmoi

brew bundle install chezmoi

## 3. Apply chezmoi from repo

chezmoi init --apply https://github.com/jose-oc/dotfiles.git

## 4. Install brew packages

brew bundle install --file="$HOME/Brewfile"
