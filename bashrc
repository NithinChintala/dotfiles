test -e /etc/bashrc && source /etc/bashrc

# ----------------------- environment variables ----------------------
export TERM=xterm-256color
export EDITOR=vi

# ----------------------------- dircolors ----------------------------
eval "$(dircolors $HOME/.dircolors)"

# --------------------------- prompt ---------------------------------
export PS1="\[\e[93m\]$\[\e[0m\] "

__ps1() {
  local end='$'
  local x='\[\e[0m\]'  # reset
  local k='\[\e[90m\]' # blacK
  local r='\[\e[91m\]' # Red
  local g='\[\e[92m\]' # Green
  local y='\[\e[93m\]' # Yellow
  local b='\[\e[94m\]' # Blue
  local m='\[\e[95m\]' # Magenta
  local c='\[\e[96m\]' # Cyan
  local w='\[\e[97m\]' # White

  # Use # if root, otherwise $
  if [[ "$EUID" == "0" ]]; then
    end='#'
  fi
    
  # Equivalent to \W
  local dir="${PWD##*/}"
  if [[ "$PWD" == "$HOME" ]]; then
    dir='~'
  fi

  # local br=$(git branch --show-current 2>/dev/null)
  local br=$(git branch | awk '/\*/ { print $2; } 2> /dev/null')
  local brc="$c"
  if [[ -n "$br" ]]; then
    if [[ "$br" == "main" || "$br" == "master" ]]; then
      brc="$r"
    fi
    br="$k($brc$br$k)"
  fi

  PS1="$y\u$k@$b\h$k:$m$dir$br$y$end$x "
}

# ------------------------------ aliases -----------------------------
alias g=git

