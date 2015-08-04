#!/bin/sh
#set -o nounset
#set -o errexit

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Bunch of symlinks

ln -sfv "$DOTFILES_DIR/runcom/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/runcom/.bashrc" ~
ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~
ln -sfv "$DOTFILES_DIR/git/.githelpers" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~
ln -sfv "$DOTFILES_DIR/.emacs.d" ~
ln -sfv "$DOTFILES_DIR/.tmux.conf" ~
ln -sfv "$DOTFILES_DIR/plugins.sbt" ~/.sbt/*/plugins

if [ ! -d ~/.cask ]; then
    mkdir ~/.cask
fi

for i in "cask.el" "cask-bootstrap.el"
do
    if [ -a "/usr/local/share/emacs/site-lisp/cask/$i" ]; then
       ln -sfv "/usr/local/share/emacs/site-lisp/cask/$i"  ~/.cask
    fi
done
if [ ! -d $HOME/.virtualenvs ]; then
    mkdir $HOME/.virtualenvs
fi
