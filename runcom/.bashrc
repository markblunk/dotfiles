# If not running interactively, don't do anything

[[ -z "$PS1" ]] && return

# Shell

if [[ -n "$ZSH_VERSION" ]]; then
    readonly SHELL_ZSH=true
    readonly SHELL_BASH=false
elif [[ -n "$BASH_VERSION" ]]; then
    readonly SHELL_BASH=true
    readonly SHELL_ZSH=false
fi

# OS

if [[ "$(uname -s)" = "Darwin" ]]; then
    readonly OS="OSX"
else
    readonly OS=$(uname -s)
fi

# Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0)

DOTFILES_DIR="$HOME/dotfiles"


#READLINK=$(which greadlink || which readlink)
#if $SHELL_BASH; then
 #   CURRENT_SCRIPT=${BASH_SOURCE}
#else
#    CURRENT_SCRIPT=${0}
#fi

#if [[ -n $CURRENT_SCRIPT && -x "$READLINK" ]]; then
#    #THIS IS MAKING AN ERROR
#    SCRIPT_PATH=$($READLINK -f "$CURRENT_SCRIPT")
#    DOTFILES_DIR=$(dirname $(dirname ${SCRIPT_PATH}))
#elif [ -d "$HOME/.dotfiles" ]; then
#    DOTFILES_DIR="$HOME/.dotfiles"
#else
#    echo "Unable to find dotfiles, exiting."
 #   return # `exit 1` would quit the shell itself
#fi

#create an array of dotfiles_dir, add work_dotfiles if they exist
#DIRS=($DOTFILES_DIR)
#if [[ -d $HOME/.work-dotfiles ]]; then
#    DIRS+=("$HOME/.work-dotfiles")
#fi

# Finally we can source the dotfiles (order matters)
for DOTFILE in "$DOTFILES_DIR"/system/.{function,path,env,alias,completion,grep,prompt,custom}; do
    [[ -f "$DOTFILE" ]] && source "$DOTFILE"
done

if [[ $OS = "OSX" ]]; then
    for DOTFILE in "$DOTFILES_DIR"/system/.{env,path,alias,function}.osx; do
        [[ -f "$DOTFILE" ]] && source "$DOTFILE"
    done
fi

if [[ $OS = "Linux" ]]; then
    for DOTFILE in "$DOTFILES_DIR"/system/.{env,path,alias,function}.linux; do
        [[ -f "$DOTFILE" ]] && source "$DOTFILE"
    done
fi

if $SHELL_BASH; then
    for DOTFILE in "$DOTFILES_DIR"/system/.*.bash; do
        [[ -f "$DOTFILE" ]] && source "$DOTFILE"
    done
fi

#git stuff
for i in ".git-prompt.sh" ".git-completion.bash"
do
    source "$DOTFILES_DIR/git/$i"
done

# virtualenvwrapper stuff
export WORKON_HOME=$HOME/.virtualenvs
#export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source $HOME/.local/bin/virtualenvwrapper.sh

# Clean up
unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE DIRS

# Export
export SHELL_BASH OS DOTFILES_DIR

# OPAM configuration
. /home/mblunk/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
