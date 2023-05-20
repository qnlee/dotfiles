#!/bin/bash

DOTFILES="$HOME/dotfiles"

# Temp mappings, might move local files around later
declare -A backup_paths=(
  ["$HOME/.vim/.vimrc"]="$DOTFILES/.vim/.vimrc"
  ["$HOME/.bashrc"]="$DOTFILES/.bash/.bashrc"
  ["$HOME/.bash_profile"]="$DOTFILES/.bash/.bash_profile"
  ["$HOME/.ideavimrc"]="$DOTFILES/.idea/.ideavimrc"
  ["$HOME/.oh-my-bash/.oh-my-bash.sh"]="$DOTFILES/.oh-my-bash/.oh-my-bash.sh"
  ["$HOME/.config/alacritty/alacritty.yml"]="$DOTFILES/.config/alacritty/alacritty.yml"
  ["$HOME/.config/nvim/init.vim"]="$DOTFILES/.config/nvim/init.vim"
)

# TODO: get rid of these or use them in mappings too
local_vimdir="$HOME/.vim"
local_bashdir="$HOME"
local_cfgdir="$HOME/.config"
local_ideadir="$HOME"
local_ombdir="$HOME/.oh-my-bash"
local_scriptdir="$HOME/scripts"
# local_gitpromptdir="/opt/homebrew/opt/bash-git-prompt/share"

# Files to back up
files_to_backup=(
    "$local_vimdir/.vimrc"
 	"$local_bashdir/.bashrc"
 	"$local_bashdir/.bash_profile"
	"$local_ombdir/.oh-my-bash.sh"
	"$local_ideadir/.ideavimrc"
  	"$local_cfgdir/alacritty/alacritty.yml"
  	"$local_cfgdir/nvim/init.vim"
  	# "$local_gitpromptdir/gitprompt.sh"
)

# Set the current date as branch name
BRANCH_NAME=$(date +'%Y%m%d')

# Initialize changed flag
changes_made=false

# Checkout to dev branch
cd "$DOTFILES"
if git show-ref --quiet refs/heads/"$BRANCH_NAME"; then
  if [[ ! "$(git rev-parse --abbrev-ref HEAD)" == "$BRANCH_NAME" ]]; then
  	git checkout "$BRANCH_NAME"
  fi
else
  git checkout -b "$BRANCH_NAME"
fi

# Backup scripts
if ! cmp -s "$path" "${backup_paths[$path]}/$(basename "$path")"; then
    cp -R "$local_scriptdir"/* "$DOTFILES/scripts/"
    changes_made=true
    echo "Backed up scripts to $DOTFILES/scripts/"
fi

# Backup specific files
for path in "${files_to_backup[@]}"; do
  if [[ -e "$path" ]]; then
    if ! cmp -s "$path" "${backup_paths[$path]}"; then
	  cp "$path" "${backup_paths[$path]}"
      # git add "${backup_paths[$path]}/$(basename "$path")"
      echo "Backed up $( "$path") to ${backup_paths[$path]}"
      changes_made=true
    fi
  fi
done

# Commit changes if any were made
if [[ "$changes_made" == true ]]; then
  git add "."
  git commit -m "Update via backup: $(date +'%Y-%m-%d %H:%M:%S')"
  echo "Changes committed"
else
  echo "No changes made"
fi

# Checkout to main and return to original dir
git checkout main
cd -
echo "Dotfiles backup completed!"