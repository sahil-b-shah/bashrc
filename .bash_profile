
export PATH=/usr/local/bin:$PATH

export NVM_DIR="/Users/sahilshah/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

eval "$(rbenv init -)"

#VirtualEnv wrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Documents/code
source /usr/local/bin/virtualenvwrapper.sh

_ssh_py() {
    local cur opts

    cur="${COMP_WORDS[COMP_CWORD]}"
    local IFS=$'\n'
    #opts=$(cat $cachefile | sed -n 's/.*"Name": "\(.*\)".*/\1/p')
    opts=$( ec2inventory --complete --env=\* --cache)
    COMPREPLY=( $(compgen -W "$opts" -- $cur ) )
    return 0
  }
  complete -F _ssh_py srv

  #aliases to make my life easier:                                                   
alias gs="git status"                                                              
alias gc="git checkout"                                                            
alias h="history"                                                                  
alias code="cd ~/Documents/code"                                                             
                                                                                   
# colors in bash!                                                                  
export CLICOLOR=1                                                                  
export LSCOLORS=GxFxCxDxBxegedabagaced                                             
                                                                                   
# GIT BRANCH IN PROMPT                                                             
parse_git_branch() {                                                               
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'             
}                                                                                  
export PS1="\[$(tput setaf 154)\]\u \[$(tput setaf 33)\]\W\[$(tput setaf 161)\]\$(parse_git_branch) \[$(tput sgr0)\]$ "
# zsh
# setopt PROMPT_SUBST
# export PROMPT='%F{154}%n %F{33}%~%F{161}$(parse_git_branch) %F{white}%# '  # Just home dir
# export PROMPT='%F{154}%n%F{33}%/%F{161}$(parse_git_branch) %F{white}%# '  # Full path
                                                                                   
# GIT BASH COMPLETION                                                              
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
# complete -o default -o nospace -F _git g
