# dotfiles

Review the project https://dotfiles.github.io/ 
and the bootstrap https://github.com/thoughtbot/dotfiles

## Using chezmoi

This repository is managed with chezmoi.

### Initial setup on a new machine

Install Homebrew first, then install chezmoi:

```bash
brew install chezmoi
```

Create a file with the custom data for your machine:
```bash
❯ cat ~/.config/chezmoi/chezmoi.toml
[data]
  profile = "personal"
  email = "jose@mail.com"
```

Depending on the profile you'll have different brew packages installed, at the moment we support 'work' and 'personal' profiles. 

Initialize and apply this repo:

```bash
chezmoi init --apply git@github.com:jose-oc/dotfiles.git
```

### Daily workflow

Check for differences between the source state and the home directory:

```bash
chezmoi diff
```

Edit a managed file:

```bash
chezmoi edit ~/.zshrc
chezmoi edit ~/.zprofile
chezmoi edit ~/.gitconfig
```

Apply the changes to the home directory:

```bash
chezmoi apply
```

#### Important chezmoi workflow note

Managed files should be edited with chezmoi, not directly in `$HOME`.

Examples:

```bash
chezmoi edit ~/.zshrc
chezmoi edit ~/.zprofile
chezmoi edit ~/.config/nvim/init.lua
chezmoi apply
```

If you edit a managed file directly in your home directory, a later `chezmoi apply` may overwrite your changes.
That will save future-you some frustration.


Add a new file to be managed:

```bash
chezmoi add ~/.config/nvim
chezmoi add ~/Brewfile
```

### Git workflow

The chezmoi source directory lives here:

```bash
~/.local/share/chezmoi
```

Commit and push changes from there:

```bash
cd ~/.local/share/chezmoi
git status
git add .
git commit -m "Update dotfiles"
git push
```



