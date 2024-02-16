autoload -Uz compinit promptinit
compinit
promptinit
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*' menu select

case "$ID" in
  "gentoo")
    prompt gentoo
    zstyle ':completion::complete:*' use-cache 1
esac
