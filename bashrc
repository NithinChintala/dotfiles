[[ -e /etc/bashrc ]] && source /etc/bashrc

# ----------------------- environment variables ----------------------
export GITUSER="NithinChintala"
export GHREPOS="$HOME/repos/github.com/$GITUSER"
export DOTFILES="$HOME/repos/github.com/$GITUSER/dotfiles"
export SCRIPTS="$HOME/.local/bin/scripts"

export TERM=xterm-256color
export EDITOR=vi

# ----------------------------- dircolors ----------------------------
eval "$(dircolors $HOME/.dircolors)"

# ------------------------------- path ------------------------------
export PATH="$HOME/.local/bin/scripts:$PATH"

# --------------------------- prompt ---------------------------------
# export PS1="\[\e[93m\]$\[\e[0m\] "
PROMPT_COMMAND="__ps1"

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
  if [[ $EUID == "0" ]]; then
    end='#'
  fi
    
  # Equivalent to \W but allows custom replacements
  local dir="${PWD##*/}"
  if [[ $PWD == $HOME ]]; then
    dir='~'
  elif [[ -z $dir ]]; then
    dir='/'
  fi

  # local br=$(git branch --show-current 2>/dev/null) # requires Git 2.22
  local br=$(git branch 2> /dev/null | awk '/\*/ { print $2; }')
  local brc="$c"
  if [[ -n $br ]]; then
    if [[ $br == "main" || $br == "master" ]]; then
      brc="$r"
    fi
    br="$k($brc$br$k)"
  fi

  PS1="$y\u$k@$b\h$k:$m$dir$br$y$end$x "
}

# ------------------------------ aliases -----------------------------
alias g=git
alias dot='cd $DOTFILES'
alias scripts='cd $SCRIPTS'

# ---------------------------- functions -----------------------------
repos() {
  if [[ -n $COMP_LINE ]]; then
      for d in $(ls "$GHREPOS"); do
          [[ ${d:0:${#2}} == $2 ]] && echo "$d"
      done
      exit
  fi
  cd "$GHREPOS/$1"
}

# --------------------------- compleition ----------------------------
complete -C repos repos
complete -C custom custom

