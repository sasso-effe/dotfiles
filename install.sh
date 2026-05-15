#!/bin/bash

set -e

skip() { echo "SKIP: $1 is already installed."; }

# oh-my-zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
  skip "oh-my-zsh"
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# dotfiles
for f in .[^.]*; do [ "$f" != ".git" ] && cp -ir "$f" ..; done

# font cache
fc-cache -f -r

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# powerlevel10k
if [ -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  skip "powerlevel10k"
else
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
fi

# zsh-syntax-highlighting
if [ -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  skip "zsh-syntax-highlighting"
else
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# zsh-autosuggestions
if [ -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  skip "zsh-autosuggestions"
else
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# you-should-use
if [ -d "$ZSH_CUSTOM/plugins/you-should-use" ]; then
  skip "you-should-use"
else
  git clone https://github.com/MichaelAquilina/zsh-you-should-use.git "$ZSH_CUSTOM/plugins/you-should-use"
fi
