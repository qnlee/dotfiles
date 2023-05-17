# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

# Path to your oh-my-bash installation.
export OSH='/Users/alee/.oh-my-bash'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
# OSH_THEME="binaryanomaly"
# PROMPT='[\[$(date "+%Y-%m-%d %H:%M:%S")\]] \u@\h \[\033[00m\]\$ '

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Set the command execution time stamp shown in the history command output
HIST_STAMPS='[yyyy-mm-dd]'

# Would you like to use another custom folder than $OSH/custom?
# OSH_CUSTOM=/path/to/new-custom-folder

# To disable the uses of "sudo" by oh-my-bash, please set "false" to
# this variable.  The default behavior for the empty value is "true".
OMB_USE_SUDO=true

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
  tmux-autoattach
)

# Which plugins would you like to conditionally load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: 
#  if [ "$DISPLAY" ] || [ "$SSH" ]; then
#      plugins+=(tmux-autoattach)
#  fi
source "$OSH"/oh-my-bash.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

##################################
# Anna's Additions
##################################
set -o vi
set +o noclobber

parse_git_branch() {
    local branch
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ -n $branch ]]; then
        echo " ($branch)"
    fi
}

# Python
alias python='python3'
alias pip='pip3'

# List
alias left='ls -t -1'
alias lt='du -sh * | sort -h'
alias ls='ls --color -a'

# Access files 
alias brc='vim ~/.bashrc'
alias sbrc='source ~/.bashrc'
alias vrc='vim ~/.vim/.vimrc'
alias svrc='source ~/.vim/.vimrc'

# Run scripts
alias bdf='cd ~/scripts && ./backup_dotfiles.sh && back'
alias back='cd -'

# Misc
alias at='alacritty-themes'
alias vnote='vim ~./notes.md'
alias macd='open -a MacDown'
alias obsd='open -a Obsidian'

# Env var settings
export PATH=$PATH:~/.docker/bin
export PATH="/bin:/usr/bin:$PATH"
export PATH=/opt/homebrew/bin:$PATH
export PATH="/opt/homebrew/opt/ncurses/bin:$PATH"
# export GOROOT=`go env GOROOT`
# export GOPATH=/Users/alee/go
# export PATH=$PATH:$GOBIN

export EDITOR="vim"
export VISUAL="vim"

export CLICOLOR=1
export PS1="[\$(date '+%Y-%m-%d %H:%M:%S')] \u@\h \w\[\$(parse_git_branch)\] $ "

