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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/mblunk/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${HOME}/miniconda3/etc/profile.d/conda.sh" ]; then
        . "${HOME}/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="${HOME}/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Finally we can source the dotfiles (order matters)
for DOTFILE in "$DOTFILES_DIR"/system/.{function,path,env,alias,grep,prompt,custom}; do
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

# OPAM configuration
. $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Clean up
unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE DIRS

# Export
export SHELL_BASH OS DOTFILES_DIR
