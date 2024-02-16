alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias cd="cd -P"
alias ga="git add"
alias gc="git commit"
alias gco="git checkout"
alias grep='grep --color=auto'
alias h='cd ~'
alias history='history | less'
alias ip='ip -color=auto'
alias ls='ls --color=auto'
alias q='exit'
if command -v nvim &> /dev/null; then
  alias v='nvim'
  alias view='nvim -R'
elif command -v vim &> /dev/null; then
  alias v='vim'
fi

if command -v latexmk &> /dev/null; then
  alias latexmk='latexmk -pvc'
fi

if command -v trash &> /dev/null; then
  alias rm='trash'
else
  alias rm='rm -i'
fi

if command -v iwctl &> /dev/null; then
  alias wlanscan='iwctl station wlan0 scan && sleep 1 && iwctl station wlan0 get-networks'
fi
