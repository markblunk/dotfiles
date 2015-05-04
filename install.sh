#!/bin/sh

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Bunch of symlinks

ln -sfv "$DOTFILES_DIR/runcom/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~
ln -sfv "$DOTFILES_DIR/git/.githelpers" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~
ln -sfv "$DOTFILES_DIR/.emacs.d" ~
ln -sfv "$DOTFILES_DIR/.tmux.conf" ~

if [ ! -d ~/.cask ]; then
    mkdir ~/.cask
fi

for i in "cask.el" "cask-bootstrap.el"
         do
             if [ -a "/usr/local/Cellar/cask/0.7.2/$i" ]; then

                 ln -sfv "/usr/local/Cellar/cask/0.7.2/$i" ~/.cask
             fi
done
#if [ "$(uname)" == "Darwin" -a -f "$DOTFILES_DIR/install/osx.sh" ]; then
#    source "$DOTFILES_DIR/install/osx.sh"
#fi
