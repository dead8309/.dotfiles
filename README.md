# dotfiles

This directory contains the dotfiles i use.

## Requirements

Ensure you have the following installed on your system

### Git

```
sudo apt install git
```

### Stow

```
sudo apt install stow
```

### Tmux (tpm)

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```


## Installation

First, check out the dotfiles repo in your $HOME directory using git


```
$ git clone git@github.com/dead8309/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```

$ stow .
```
