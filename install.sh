#!/bin/bash

# Base Script File (install.sh)
# Created: Mon Jul  1 15:03:41 2013
# Version: 1.0
# Author: François-Xavier Thomas <fx.thomas@gmail.com>
#
# This Bash script was developped by François-Xavier Thomas.
# You are free to copy, adapt or modify it.
# If you do so, however, leave my name somewhere in the credits, I'd appreciate it ;)
# Modified by Sgryco

BASEDIR=$(pwd)

function copyconf {
  IN="$BASEDIR/$1"
  OUT="$2/$1"
  if [ -e "$OUT" ]; then
    echo ">>> $OUT exists. Overwrite? (y/N) "
    read _ok
  else
    echo -n ">>> $IN -> $OUT"
    _ok='y'
  fi
  if [[ $_ok == 'y' ]]; then
    rm -rvi "$OUT"
    cp "$IN" "$OUT" >/dev/null 2>&1
  fi
}

function linkconf {
  IN="$BASEDIR/$1"
  OUT="$2/${3:-$1}"
  if [ -f "$OUT" ]; then
    echo ">>> $OUT exists. Overwrite? (y/N) "
    read _ok
  else
    echo -n ">>> $IN -> $OUT"
    _ok='y'
  fi
  if [[ $_ok == 'y' ]]; then
    rm -rv "$OUT"
    ln -s "$IN" "$OUT" >/dev/null 2>&1
  fi
}

# Update submodules
echo "Updating submodules..."
git submodule init
git submodule update

# Link configuration
echo "Linking configuration..."
linkconf .oh-my-zsh ~
linkconf .bash_profile ~
linkconf .bashrc ~
copyconf .gitconfig ~
linkconf .gitbase ~
linkconf .gitignore_global ~
linkconf .tmux.conf ~
linkconf .vim ~
linkconf .vimrc ~
linkconf .zshrc ~
linkconf .aliases ~
linkconf .profile ~
linkconf fx.zsh-theme ~/.oh-my-zsh/themes
mkdir -p ~/.config/htop && linkconf htoprc ~/.config/htop
mkdir -p ~/.config/nvim && linkconf .vimrc ~/.config/nvim init.vim

# Finish!
echo "All done!"
