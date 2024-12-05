#!/bin/bash

# Set $DOTFILES env var (where dotfile repo lives)
DOTFILES=`pwd`
if [ $# -eq 1 ]; then
  DOTFILES="$DOTFILES/$1"
elif [ ! $# -eq 0 ]; then
  echo "Invalid number of arguments"
  exit 1
fi
if [ ! -d "$DOTFILES" ]; then
  echo "DOTFILES dir '$DOTFILES' does not exist"
  exit 2
fi
export DOTFILES=$DOTFILES
echo "DOTFILES env var set to '$DOTFILES'"

# Make symbolic links to dotfiles
dotfiles=("cmnrc" "zshrc" "zshenv" "bashrc" "vimrc" "vim" "tmux.conf")
for df in "${dotfiles[@]}"; do
  if [[ -f "$DOTFILES/$df" || -d "$DOTFILES/$df" ]]; then
    ln -s $DOTFILES/$df $HOME/.$df
    if [ $? -eq 0 ]; then
      echo "Created symlink $HOME/.$df -> $DOTFILES/$df"
    fi
  else
    echo "Dotfile '$DOTFILES/$df' does not exist"
fi
done

# source shell and vim profiles
if [[ -f $HOME/.bashrc && $SHELL == *"bash"* ]]; then
  source $HOME/.bashrc 
  echo "Bash profile loaded"
elif [[ $SHELL == *"zsh"* ]]; then
  if [[ -f $HOME/.zshrc ]]; then
    source $HOME/.zshrc 
    echo "Zsh profile loaded"
  fi
  if [[ -f $HOME/.zshenv ]]; then
    source $HOME/.zshrc 
    echo "Zsh env vars loaded"
  fi
fi
