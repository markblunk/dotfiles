#!/bin/bash
#set -o nounset
#set -o errexit

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR=$(dirname $0)
# Bunch of symlinks

ln -sfv "$DOTFILES_DIR/runcom/.bash_profile" $HOME
ln -sfv "$DOTFILES_DIR/runcom/.bashrc" $HOME
ln -sfv "$DOTFILES_DIR/runcom/.inputrc" $HOME
ln -sfv "$DOTFILES_DIR/git/.githelpers" $HOME
ln -sfv "$DOTFILES_DIR/git/.gitconfig" $HOME
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" $HOME
ln -sfv "$DOTFILES_DIR/.emacs.d" $HOME
ln -sfv "$DOTFILES_DIR/.tmux.conf" $HOME
