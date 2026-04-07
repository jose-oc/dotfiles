# New Mac setup

## 1. Install Homebrew
Follow the Homebrew install instructions.

## 2. Restore packages
brew bundle install --file="$HOME/Brewfile"

## 3. Shell config
- copy ~/.zshrc
- copy ~/.zprofile
- copy ~/.config/nvim

## 4. Secure tools
- sign in to 1Password
- run `op signin`
- enable 1Password SSH agent
- run `gcloud init`
- run `aws configure sso`

## 5. Verify
python3 --version
ansible --version
kubectl version --client
op account list
nvim --version

