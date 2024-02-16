if [[ -d "$HOME/.local/bin" ]]; then
  export PATH=$HOME/.local/bin:$PATH
fi

if [[ -d "$HOME/.deno/bin" ]]; then
  export PATH=$HOME/.deno/bin:$PATH
fi

if [[ -d "/snap/bin" ]]; then
  export PATH=/snap/bin:$PATH
fi
