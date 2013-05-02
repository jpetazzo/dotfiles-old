# Aliases

alias reload='. ~/.bash_profile'	# Make bash profile changes take effect immediately
alias rmhost='ssh-keygen -R'		# Remove entry from known_hosts


# Don't do something you regret.
alias rm='rm -i' 
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -v'

alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

alias which='type -a'			# More helpful which
alias duf='du -sk * | sort -nr | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'''
