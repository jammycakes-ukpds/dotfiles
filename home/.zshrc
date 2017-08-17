#! /usr/bin/env zsh

DOTFILES=$(python -c "import os,sys,os.path; print(os.path.dirname(os.path.dirname(os.readlink(os.path.expanduser('~/.zshrc')))))")

source $DOTFILES/lib/ohmyzsh.zsh
source $DOTFILES/lib/zsh/zshrc.zsh