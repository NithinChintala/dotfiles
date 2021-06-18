test -e /etc/bashrc && source /etc/bashrc

# ls colors
eval "$(dircolors $HOME/.dircolors)"

# Prompt
# Why the "\[" and "\]" ?
# They prevent the width of the prompt being weird if you don't
# put these sometimes your prompt will act like it's larger than
# it's visible size.
yellow='\[\e[33m\]'
reset='\[\e[0m\]'
export PS1="$yellow\$$reset "

# Aliases
alias g=git

# Environment Variables
export EDITOR=vi
