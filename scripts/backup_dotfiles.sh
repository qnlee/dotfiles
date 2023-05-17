#!/bin/bash

dotfiles_dir="$HOME/dotfiles"
dotfiles_vimdir="$HOME/dotfiles/.vim"
dotfiles_bashdir="$HOME/dotfiles/.bash"
dotfiles_cfgdir="$HOME/dotfiles/.config"
dotfiles_ideadir="$HOME/dotfiles/.idea"
dotfiles_ombdir="$HOME/dotfiles/.oh-my-bash"
dotfiles_scriptdir="$HOME/dotfiles/scripts"

local_vimdir="$HOME/.vim"
local_bashdir="$HOME"
local_cfgdir="$HOME/.config"
local_ideadir="$HOME"
local_ombdir="$HOME/.oh-my-bash"
local_scriptdir="$HOME/scripts"

# Backup .vimrc
if [[ -f "$local_vimdir/.vimrc" ]]; then
    cp "$local_vimdir/.vimrc" "$dotfiles_vimdir"
    echo "Backed up .vimrc to $dotfiles_vimdir/.vimrc"
fi

# Backup .bashrc
if [[ -f "$local_bashdir/.bashrc" ]]; then
    cp "$local_bashdir/.bashrc" "$dotfiles_bashdir/.bashrc"
    echo "Backed up .bashrc to $dotfiles_bashdir/.bashrc"
fi

# Backup .bash_profile
if [[ -f "$local_bashdir/.bash_profile" ]]; then
    cp "$local_bashdir/.bash_profile" "$dotfiles_bashdir/.bash_profile"
    echo "Backed up .bash_profile to $dotfiles_bashdir/.bash_profile"
fi

# Backup .oh-my-bash.sh
if [[ -f "$local_ombdir/.oh-my-bash.sh" ]]; then
    cp "$local_ombdir/.oh-my-bash.sh" "$dotfiles_ombdir"
    echo "Backed up .oh-my-bash.sh to $dotfiles_ombdir"
fi

# Backup .config/alacritty
if [[ -d "$local_cfgdir/alacritty" ]]; then
    cp -R "$local_cfgdir/alacritty" "$dotfiles_cfgdir/alacritty"
    echo "Backed up .config to $dotfiles_cfgdir"
fi

# Backup .idea directory
if [[ -f "$local_ideadir/.ideavimrc" ]]; then
    cp "$local_ideadir/.ideavimrc" "$dotfiles_ideadir"
    echo "Backed up .idea to $dotfiles_ideadir"
fi

# Backup scripts directory
if [[ -d "$local_scriptdir" ]]; then
    cp -R "$local_scriptdir"/* "$dotfiles_scriptdir"
    echo "Backed up scripts to $dotfiles_scriptdir"
fi

echo "Dotfiles backup completed!"
