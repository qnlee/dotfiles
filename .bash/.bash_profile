# Set env vars
export EDITOR='vim'
export GOROOT=`go env GOROOT`
export GOPATH=/Users/alee/go
export PATH=$PATH:$GOBIN

# .bash_profile -*- mode: sh -*-

# Load login settings and environment variables
# if [[ -f ~/.profile ]]; then
#   source ~/.profile
# fi

# Load interactive settings
if [[ -f ~/.bashrc ]]; then
  source ~/.bashrc
fi

# WarpDir (v1.7.0, appended on 2023-04-12 17:29:33 -0700) BEGIN
[[ -f ~/.bash_wd ]] && source ~/.bash_wd
# WarpDir (v1.7.0, appended on 2023-04-12 17:29:33 -0700) END

export PATH="/opt/homebrew/opt/ncurses/bin:$PATH"
