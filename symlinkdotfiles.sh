#!/bin/bash
##################################
# symlinkdotfiles.sh
# This script creates symbolic links from ~/ to ~/dotfiles/
##################################

# Variables

dir=$HOME/dotfiles/			# dotfiles directory
olddir=$HOME/dotfiles_old/		# dotfiles backup directory
dircontents=$(ls $dir | grep -v `basename $0`)
files=$dircontents		# list of files/folders to symlink in homedir

echo "Hello! This script will backup existing dotfiles in $HOME and replace them with symlinks to the configuration files in $dir:"
echo "Directory contents:"
echo $dircontents && echo

# create ~/dotfiles_old ( $olddir )
echo -n "Creating `tput bold`$olddir`tput sgr0` for backup of any existing dotfiles in `tput bold`$HOME/`tput sgr0`... "
mkdir -p $olddir && echo "Done!" && echo

cd $dir

# Move any existing dotfiles in ~/ to ~/dotfiles_old/, then create symlinks

echo "Files to be moved: "
for file in $files; do
	echo "`tput bold`$HOME/.$file`tput sgr0`"
done
echo

for file in $files; do
	dotfile="$HOME/.$file"
	echo "checking if `tput bold`$dotfile`tput sgr0` exists..."
	if [ -f $dotfile ] 
	then 
		echo "`tput bold`$dotfile`tput sgr0` exists. Checking if it's a symlink..."
		if [ ! -L $dotfile ]
		then
			echo "Not a symlink! Moving `tput bold`$dotfile`tput sgr0` to `tput bold`$olddir`tput sgr0` for safekeeping..."
			mv $dotfile $olddir
		else
			echo "`tput bold`$dotfile`tput sgr0` is a symlink. Removing..."
			rm -v $dotfile
		fi
	else
		echo "$dotfile does not exist, or is just a symlink."
	fi
	echo "Creating symlink to `tput bold`$dir$file`tput sgr0` from `tput bold`$dotfile`tput sgr0`..."
	ln -s $dir$file $dotfile

	echo "Done!" && echo
done
