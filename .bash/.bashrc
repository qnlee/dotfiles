# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

# Path to your oh-my-bash installation.
export OSH="$HOME/.oh-my-bash"

# Uncomment the following line if you want to disable marking untracked files under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Set the command execution time stamp shown in the history command output
HIST_STAMPS='[yyyy-mm-dd]'

# Which completions would you like to load? (completions can be found in ~/.oh-my-bash/completions/*)
# Custom completions may be added to ~/.oh-my-bash/custom/completions/
# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.
completions=(
  git
  composer
  ssh
)

# Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
aliases=(
  general
)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
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

# Python
alias python='python3'
alias pip='pip3'

# List
alias left='ls -t -1'
alias lt='du -sh * | sort -h'
alias ls='ls -a --color=auto'
alias rm='rm -r '

# Access files
alias brc='nvim ~/.bashrc'
alias sbrc='source ~/.bashrc'
alias vrc='nvim ~/.vim/.vimrc'
alias bp='nvim ~/.bash_profile'
alias sbp='source ~/.bash_profile'

# Run scripts
alias bdf='cd ~/scripts && source backup_dotfiles.sh && ./backup_dotfiles.sh && back'
alias back='cd -'

# Misc
# alias at='alacritty-themes'
alias vnote='nvim ~./notes.md'
alias macd='open -a MacDown'
alias obsd='open -a Obsidian'

# Configure command prompt
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_SHOW_UPSTREAM=0 
GIT_PROMPT_SHOW_UNTRACKED_FILES=normal

CURR_DATE="\[\e[34m\]$(date '+%Y-%m-%d')\[\e[m\]"
CURR_TIME="\[\e[34m\]$(date '+%H:%M:%S')\[\e[m\]"
CURR_DIR="\[\e[33m\]\w\[\e[m\]"

GIT_PROMPT_START="<$CURR_DATE $CURR_TIME> $CURR_DIR"  
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
export PATH="/.docker/bin:$PATH"
export PATH="/opt/homebrew/opt/ncurses/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

