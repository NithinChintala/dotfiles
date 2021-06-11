test -e /etc/bashrc && source /etc/bashrc

# ls colors
eval "$(dircolors $HOME/.dircolors)"

# Prompt
yellow='\e[33m'
reset='\e[0m'
export PS1="$yellow\$$reset "

# Aliases
alias g=git

# Environment Variables
export EDITOR=vi
