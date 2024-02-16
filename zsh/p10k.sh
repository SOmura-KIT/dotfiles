if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
else
  export PS1='%n@%m:%~%#
$ '
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
