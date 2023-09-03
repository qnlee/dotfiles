# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

# Path to your oh-my-bash installation.
export OSH="$HOME/.oh-my-bash"

# Uncomment the following line if you want to disable marking untracked files under VCS as dirty.
# This makes repository status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Set the command execution time stamp shown in the history command output
HIST_STAMPS='[yyyy-mm-dd]'

# Which completions would you like to load? (completions can be found in ~/.oh-my-bash/completions/*)
# Custom completions may be added to ~/.oh-my-bash/custom/completions/
completions=(
  git
  composer
)

# Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
aliases=(
  general
)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
plugins=(
  git
  goenv
  golang
)

source "$OSH"/oh-my-bash.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

########################################################################################## 
# Anna's Additions
########################################################################################## 
set -o vi
set +o noclobber

# List / Access
alias back='cd -'
alias left='ls -t -1'
alias lt='du -sh * 2>/dev/null | sort -h'
alias lsa='ls -a --color=auto'
alias rm='rm -r'

# Dotfiles 
alias bashprof='~/.bashprofile'
alias bashrc='~/.bashrc'
alias vimrc='~/.vim/.vimrc'

alias brc='nvim ~/.bashrc'
alias sbrc='source ~/.bashrc'
alias vrc='nvim ~/.vim/.vimrc'
alias bp='nvim ~/.bash_profile'
alias sbp='source ~/.bash_profile'

# Run Script 
alias bdf='cd ~/scripts && source backup_dotfiles.sh && ./backup_dotfiles.sh && back'

# Misc
alias vnote='nvim ~./notes.md'
alias macd='open -a MacDown'
alias obsd='open -a Obsidian'

# Python
alias python='python3'
alias pip='pip3'

# Configure command prompt
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_SHOW_UPSTREAM=0 
GIT_PROMPT_SHOW_UNTRACKED_FILES=normal

CURR_DATE="\[\e[34m\]$(date '+%Y-%m-%d')\[\e[m\]"
CURR_TIME="\[\e[34m\]$(date '+%H:%M:%S')\[\e[m\]"
CURR_DIR="\[\e[33m\]\w\[\e[m\]"

GIT_PROMPT_START="$CURR_DATE $CURR_TIME $CURR_DIR"  
GIT_PROMPT_END=" \$ "     

if [ -f "/opt/homebrew/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR="/opt/homebrew/opt/bash-git-prompt/share"
    source "/opt/homebrew/opt/bash-git-prompt/share/gitprompt.sh"
fi

export PS1="$CURR_DATE $CURR_TIME $CURR_DIR $(__git_ps1 " (%s)")\$ "

# Set env vars
export EDITOR="nvim"
export VISUAL="nvim"

export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

# Go env
export GOROOT=`go env GOROOT`
export GOPATH=`go env GOPATH`

# PATH
export PATH=$PATH:$GOBIN
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/.docker/bin:$PATH"
export PATH="/opt/homebrew/opt/ncurses/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
