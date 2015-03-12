#mark's bashrc

#Setting the 'ol PATH
#PATH=/usr/bin:/bin:/usr/sbin:/sbin:$PATH

# Some aliai
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'





#set some defaults

export DIFF='diff'
export PAGER='less -R'

#if there is an emacs, make it the default editor, otherwise, set it to vi
if hash emacs 2>/dev/null
then
    export EDITOR='emacs'
else
    export EDITOR='vi'
fi

#some git stuff
source ~/.git-prompt.sh

#general mac stuff
if [[ $OSTYPE = darwin* ]]
then
    # Start typing a command at a shell prompt, then hit up/down for history search
    # using the inputted text as the beginning of the search string
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'

    alias emacsgui=/usr/local/Cellar/emacs/24.4/Emacs.app/Contents/MacOS/Emacs
    alias ls='ls -G'
    alias ll='ls -lG'
    export GREP_OPTIONS="--color"

    COLOR1="\[\033[0;32m\]"
    COLOR2="\[\033[1;33m\]"
    COLOR3="\[\033[0;36m\]"
    COLOR4="\[\033[0;31m\]"
    NO_COLOUR="\[\033[0m\]"
    LSCOLORS="GxFxCxDxBxegedabagaced"
    export CLICOLOR=1
    export LSCOLORS

    #if we are in a git repository, the prompt will tell us what branch were in.
    PS1=$COLOR1'\u'$COLOR2'@'$COLOR4'\h'$COLOR2:$COLOR3'\W$(__git_ps1 " (%s)") \$'$NO_COLOUR


    #java config
    export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
    PATH=$JAVA_HOME/bin:$PATH

    #hadoop config
    export HADOOP_INSTALL=/usr/local/Cellar/hadoop/2.5.1/libexec
    export HADOOP_MAPRED_HOME=$HADOOP_INSTALL
    export HADOOP_HOME=$HADOOP_INSTALL
    export HADOOP_COMMON_HOME=$HADOOP_INSTALL
    export HADOOP_HDFS_HOME=$HADOOP_INSTALL
    export YARN_HOME=$HADOOP_INSTALL
    #    export HADOOP_OPTS="${HADOOP_OPTS} -Djava.security.krb5.realm= -Djava.security.krb5.kdc="
    #   export HADOOP_OPTS="${HADOOP_OPTS} -Djava.security.krb5.conf=/dev/null"

    alias hstart="$HADOOP_INSTALL/sbin/start-dfs.sh;$HADOOP_INSTALL/sbin/start-yarn.sh"
    alias hstop="$HADOOP_INSTALL/sbin/stop-yarn.sh;$HADOOP_INSTALL/sbin/stop-dfs.sh"

    #haskell config
    PATH=$HOME/.cabal/bin:$HOME/Library/Haskell/bin:$PATH


    #rvm config
    # Load RVM into a shell session *as a function*
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
    # Load RVM function
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"


    #python2 config
    # export PYTHONPATH=/usr/local/lib/python2.7/site-packages


    #scala config
    export SCALA_HOME=/usr/local/Cellar/scala/2.*/libexec


    #spark config
    export SPARK_HOME=/usr/local/Cellar/spark/1.2.0
    export PYSPARK_SUBMIT_ARGS="--master local[2]"
    PATH=$SPARK_HOME/bin:$PATH

    #Homebrew stuff
    PATH=/usr/local/bin:$PATH
    PATH=/usr/local/sbin:$PATH

fi
#general linux stuff
if [[ $OSTYPE = linux* ]]
then
    PS1='\[\e[0;32m\]\u\[\e[m\]@\h\[\e[1;34m\]\w$(__git_ps1 " (%s)")\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
    PS2='> '
    PS4='+ '
fi

#stuff for the work laptop
if [[ -s ~/.work.sh ]]
then
    source ~/.work.sh
fi

export PATH
