#!/bin/bash

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
AUTOSUGGESTION=${ZSH_CUSTOM}/plugins/zsh-autosuggestions
SYNTAX_HIGHLIGHTING=${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting

# Installs .oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  if [[ $OSTYPE =~ darwin* ]]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  if [[ $OSTYPE =~ linux-gnu ]]; then
    sudo apt install zsh -y
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  fi
fi

# Installs plugins
[ ! -d "$AUTOSUGGESTION" ] && git clone https://github.com/zsh-users/zsh-autosuggestions "$AUTOSUGGESTION"
[ ! -d "$SYNTAX_HIGHLIGHTING" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$SYNTAX_HIGHLIGHTING"
chmod 700 "$SYNTAX_HIGHLIGHTING"