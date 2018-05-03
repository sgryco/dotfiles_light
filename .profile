# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# Editor is VIM
export EDITOR=vim


# Add aliases
if [ -f $HOME/.aliases ]; then source $HOME/.aliases; fi


#export PATH=$PATH:~/.local/bin
#export PATH=$PATH:~/.local/usr/bin
#export PATH=$PATH:~/.local/usr/lib/git-core/
export CUDA_HOME=~/cuda
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/cuda/lib64
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/.local/usr/lib
export LC_CTYPE="en_IE.UTF-8"
export LC_ALL="en_IE.UTF-8"

[ -z "$ZSH_VERSION" ] && [ -f /usr/bin/zsh ] && {
#        echo "Type Y to run zsh: "
#        read line
#        [ "$line" = Y ] && exec $HOME/.local/bin/zsh -l
         exec /usr/bin/zsh -l
}
