# History Config Options
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history

# Directory Change Options
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_silent

setopt extended_glob

# Define word endings
WORDCHARS='*?_[]~=&;!#$%^(){}<>'

# Terminal Colors

TC='\e['
Rst="${TC}0m"     # Reset all coloring and style
Black="${TC}30m";
Red="${TC}31m";
Green="${TC}32m";
Yellow="${TC}33m";
Blue="${TC}34m";
Purple="${TC}35m";
Cyan="${TC}36m";
White="${TC}37m";

if [ -z ${SHELL+x} ]; then
	export SHELL=$(which zsh)
fi

# Standard Configs
export LANG=en.US.UTF-8
export TERM=xterm-256color
export EDITOR=nvim

