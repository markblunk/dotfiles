#enable bash completion
# source /etc/profile.d/bash_completion.sh
. /etc/bash_completion

# completion for haskell build tool stack
eval "$(stack --bash-completion-script stack)"

# for some reason I need to add these manually. I think I am doing something wrong
source /usr/share/bash-completion/completions/apt
source /usr/share/bash-completion/completions/clang-10
source /usr/share/bash-completion/completions/chmod
source /usr/share/bash-completion/completions/cmake
source /usr/share/bash-completion/completions/docker
source /usr/share/bash-completion/completions/gcc
source /usr/share/bash-completion/completions/java
source /usr/share/bash-completion/completions/maven
source /usr/share/bash-completion/completions/make
source /usr/share/bash-completion/completions/openssl
source /usr/share/bash-completion/completions/ssh-add
source /usr/share/bash-completion/completions/ssh-keygen
