#!/usr/bin/env bash

cd `dirname $0`
DOTFILES_ROOT=$(pwd)

mkdir ~/.bundle
ln -s $DOTFILES_ROOT/bundle/config ~/.bundle/config

# VSCode
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false

# Vim
mkdir ~/.vim
mkdir -p ~/var/vim/undo
unlink ~/.vim/ftdetect
ln -s $DOTFILES_ROOT/vim/ftdetect ~/.vim/ftdetect
unlink ~/.vim/ftplugin
ln -s $DOTFILES_ROOT/vim/ftplugin ~/.vim/ftplugin
ln -s $DOTFILES_ROOT/gvimrc ~/.gvimrc
ln -s $DOTFILES_ROOT/vimrc ~/.vimrc

ln -s $DOTFILES_ROOT/agignore ~/.agignore
ln -s $DOTFILES_ROOT/ctags ~/.ctags
ln -s $DOTFILES_ROOT/digrc ~/.digrc
ln -s $DOTFILES_ROOT/gemrc ~/.gemrc
ln -s $DOTFILES_ROOT/gitattributes_global ~/.gitattributes_global
ln -s $DOTFILES_ROOT/gitconfig ~/.gitconfig
ln -s $DOTFILES_ROOT/gitignore_global ~/.gitignore_global
ln -s $DOTFILES_ROOT/irbrc ~/.irbrc
ln -s $DOTFILES_ROOT/my.cnf ~/.my.cnf
ln -s $DOTFILES_ROOT/pryrc ~/.pryrc
ln -s $DOTFILES_ROOT/tool-versions ~/.tool-versions
ln -s $DOTFILES_ROOT/tmux.conf ~/.tmux.conf
unlink ~/.zpreztorc
ln -s $DOTFILES_ROOT/zpreztorc ~/.zpreztorc
unlink ~/.zshrc
ln -s $DOTFILES_ROOT/zshrc ~/.zshrc
unlink ~/.zshenv
ln -s $DOTFILES_ROOT/zshenv  ~/.zshenv

# Claude Code
mkdir -p ~/.claude
unlink ~/.claude/settings.json
ln -s $DOTFILES_ROOT/claude/settings.json ~/.claude/settings.json
