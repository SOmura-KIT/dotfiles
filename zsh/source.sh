if [[ -f "$HOME/.local/source.cdf.sh" ]]; then
  source ${HOME}/.local/source/cdf.sh
fi

case "$ID" in
  "arch")
    if [[ -f "/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme" ]]; then
      source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
    fi

    if [[ -f "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
      source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    fi

    if [[ -f "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
      source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    fi
    ;;
  "debian")
    if [[ -f "$HOME/powerlevel10k/powerlevel10k.zsh-theme" ]]; then
      source $HOME/powerlevel10k/powerlevel10k.zsh-theme
    else
      git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
    fi
    if [[ -f "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
      source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    fi
    if [[ -f "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
      source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    fi
    ;;
esac
