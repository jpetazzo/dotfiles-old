#!/bin/bash
##################################
# symlinkdotfiles.sh
# This script creates symbolic links from ~/ to ~/dotfiles/
##################################

# Variables

dir=~/dotfiles			# dotfiles directory
olddir=~/dotfiles_old/		# dotfiles backup directory

dircontents=$(ls $dir | grep -v `basename $0`)
echo $dircontents

# list of files/folders to symlink in homedir
files=$dircontents

# bash_prompt \
# bash_profile \
# vimrc \
# "

# create ~/dotfiles_old
echo -n "Creating `tput bold`$olddir`tput sgr0` for backup of any existing dotfiles in `tput bold`~/`tput sgr0`... "
mkdir -p $olddir && echo "Done!" && echo

cd $dir

# Move any existing dotfiles in ~/ to ~/dotfiles_old/, then create symlinks

echo "Files to be moved: "
echo "`tput bold`$files`tput sgr0`"
echo

for file in $files; do
	echo "Moving `tput bold`~/$file`tput sgr0` to `tput bold`$olddir`tput sgr0`..."
	mv ~/.$file ~/dotfiles_old/
	echo -n "Creating symlink to `tput bold`$file`tput sgr0` in home directory...."
	ln -s $dir/$file ~/.$file
	echo "Done!" && echo
done
