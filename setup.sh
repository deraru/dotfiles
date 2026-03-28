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

# Ghostty
mkdir -p ~/.config/ghostty
unlink ~/.config/ghostty/config.ghostty
ln -s $DOTFILES_ROOT/ghostty ~/.config/ghostty/config.ghostty

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
mkdir -p ~/.claude/hooks
unlink ~/.claude/settings.json
ln -s $DOTFILES_ROOT/claude/settings.json ~/.claude/settings.json
unlink ~/.claude/CLAUDE.md
ln -s $DOTFILES_ROOT/claude/CLAUDE.md ~/.claude/CLAUDE.md
unlink ~/.claude/hooks/block-loop-commands.sh
ln -s $DOTFILES_ROOT/claude/hooks/block-loop-commands.sh ~/.claude/hooks/block-loop-commands.sh
unlink ~/.claude/hooks/setup-worktree.sh
ln -s $DOTFILES_ROOT/claude/hooks/setup-worktree.sh ~/.claude/hooks/setup-worktree.sh
ln -s $DOTFILES_ROOT/codex/AGENTS.md ~/AGENTS.md

# Codex
mkdir -p ~/.codex
mkdir -p ~/.codex/rules
unlink ~/.codex/config.toml
ln -s $DOTFILES_ROOT/codex/config.toml ~/.codex/config.toml
unlink ~/.codex/rules/default.rules
ln -s $DOTFILES_ROOT/codex/rules/default.rules ~/.codex/rules/default.rules
