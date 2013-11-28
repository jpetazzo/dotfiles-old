
# Sources
source ~/.bash_prompt
source ~/.bash_aliases
source ~/.bash_exports
source ~/.gandirc	#	\o/	
source ~/.bash_path
# source ~/.bash_powerline # Uncomment to reenable powerline

# export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages
# source /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
# http://askubuntu.com/questions/125526/vim-in-tmux-display-wrong-colors
export TERM="xterm-256color"

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

### Options
shopt -s nocaseglob 	# Case-insensitive globbing (used in pathname expansion)
shopt -s histappend 	# Append to the Bash history file rather than overwriting it
shopt -s cmdhist  	# multiline commands saved in history as oneliners

# Hoard
HISTSIZE=10000
HISTFILESIZE=100000

# Use vi command editing mode
set -o vi
set keymap vi
set convert-meta on

# ^l clear screen
bind -m vi-insert "\C-l":clear-screen

#------------------------------------------------------------------------------------------
# INCREMENTAL HISTORY SEARCH 
# "Add this to your .bashrc and you will be very happy" by Jeet
#------------------------------------------------------------------------------------------

## Up Arrow: search and complete from previous history
# bind '"\eOA": history-search-backward'
## alternate, if the above does not work for you:
bind '"\e[A":history-search-backward'

## Down Arrow: search and complete from next history
# bind '"\eOB": history-search-forward'
## alternate, if the above does not work for you:
bind '"\e[B":history-search-forward'

#------------------------------------------------------------------------------------------
#  OTHER STUFF
#------------------------------------------------------------------------------------------


