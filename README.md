# dotfiles

This directory contains the dotfiles i use.

## Requirements

Ensure you have the following installed on your system

### Git

```sh
sudo apt install git
```

### Stow

```sh
sudo apt install stow
```

### Tmux (tpm)

```sh
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```


## Installation

First, check out the dotfiles repo in your $HOME directory using git


```sh
git clone git@github.com/dead8309/dotfiles.git
cd dotfiles
```

then use GNU stow to create symlinks

```sh
stow .
```
