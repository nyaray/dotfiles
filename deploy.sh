#!/bin/bash

############
# PREAMBLE #
############

set -e

VIMFILES=~/.vimfiles
VIMSWAP=$VIMFILES/swap
VIMBACKUP=$VIMFILES/backup
VUNDLEDIR=$VIMFILES/bundle/Vundle.vim

function nl { echo; }
function notify_sub { echo "[$1] $2"; }
function notify { notify_sub "$1" "$2"; }
function step_begin { notify $1 "Starting..."; nl; }
function step_complete { nl; notify $1 "Done!"; nl; }
function ensure_dir { echo "Creating directory: $1"; mkdir -p $1; }
function copy { echo "Copying $1 into $2"; cp -r $1 $2; }

type git >/dev/null 2>&1 || { echo >&2 "Git is not available. Aborting."; exit 1; }

cd "$(dirname "$0")"


##############
# DEPLOYMENT #
##############

notify "DOTFILES DEPLOYMENT" "STARTING"

step_begin "vim"

ensure_dir ~/.vim
ensure_dir $VIMFILES
ensure_dir $VIMSWAP
ensure_dir $VIMBACKUP
nl

notify_sub "vundle" "Cleaning ..."
rm -rf $VUNDLEDIR
git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLEDIR
nl
notify_sub "vundle" "Done!"
nl

copy vim/vimrc ~/.vimrc
copy vim/gvimrc ~/.gvimrc
nl

notify_sub "vim-init" "Running vundle setup"
vim +PluginInstall! +qall

step_complete "vim"

notify "DOTFILES DEPLOYMENT" "COMPLETED"
