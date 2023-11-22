typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# 補完
autoload -Uz compinit promptinit
compinit
promptinit
zstyle ':completion:*' menu select

# aliases
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias cd="cd -P"
alias grep='grep --color=auto'
alias h='cd ~'
alias history='history | less'
alias ip='ip -color=auto'
alias latexmk='latexmk -pvc'
alias ls='ls --color=auto'
alias q='exit'
alias rm='trash'
alias v='nvim'
alias view='nvim -R'
alias wlanscan='iwctl station wlan0 scan && iwctl station wlan0 get-networks'

# binds
# zkbd と互換性のあるハッシュテーブルを作成し、
# 他のキーをこのハッシュテーブルに追加する (man 5 terminfo を参照)
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# 適宜キーを設定する
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# 最後に、zle がアクティブのときにターミナルがアプリケーションモードになるようにする。
# そのときにだけ、$terminfo の値が有効になる。
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# 履歴検索
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search
bindkey '^P' up-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search

# path
export PATH=$HOME/.local/nvim/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/leJOS_EV3_0.9.1-beta/bin:$PATH

# source
source ${HOME}/.local/source/cdf.sh
# source ${HOME}/.local/source/kit.sh

# mocword
export MOCWORD_DATA=$HOME/.local/mocword.sqlite

# パワーラインPS1
# grmlが優先される場合、
# /etc/zsh/zshrc の各行の prompt_grml_precmd_worker をコメントアウト
# powerline-daemon -q
# . /usr/share/powerline/bindings/zsh/powerline.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# TMUX
if [ ! "$TERM" = "linux" ]; then
  if which tmux >/dev/null 2>&1; then
      #if not inside a tmux session, and if no session is started, start a new session
      test -z "$TMUX" && (tmux attach || tmux new-session)
  fi
fi

neofetch

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# XWindowの起動
if [ "$TERM" = "linux" ]; then
  echo -n "Start XWindow? [Y/n] (default: Yes): "
  read ans
  case "$ans" in
    [Nn]* )
      ;;
    * )
      startx
      ;;
  esac
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/somura/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/somura/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/somura/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/somura/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/somura/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/somura/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

