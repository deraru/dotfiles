#!/usr/bin/env bash

cd `dirname $0`
DOTFILES_ROOT=$(pwd)

mkdir ~/.bundle
ln -s $DOTFILES_ROOT/bundle/config ~/.bundle/config

mkdir ~/.vscode
ln -s $DOTFILES_ROOT/vscode/settings.json ~/.vscode/settings.json
ln -s $DOTFILES_ROOT/vscode/keybindings.json ~/.vscode/keybindings.json

ln -s $DOTFILES_ROOT/ctags ~/.ctags
ln -s $DOTFILES_ROOT/digrc ~/.digrc
ln -s $DOTFILES_ROOT/gemrc ~/.gemrc
ln -s $DOTFILES_ROOT/gitattributes_global ~/.gitattributes_global
ln -s $DOTFILES_ROOT/gitconfig ~/.gitconfig
ln -s $DOTFILES_ROOT/gitignore_global ~/.gitignore_global
ln -s $DOTFILES_ROOT/gvimrc ~/.gvimrc
ln -s $DOTFILES_ROOT/irbrc ~/.irbrc
ln -s $DOTFILES_ROOT/my.cnf ~/.my.cnf
ln -s $DOTFILES_ROOT/pryrc ~/.pryrc
ln -s $DOTFILES_ROOT/tmux.conf ~/.tmux.conf
