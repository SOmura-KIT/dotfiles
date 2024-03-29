SCRIPT_PATH="$(realpath "$0")"
BASE_DIR="$(dirname "$SCRIPT_PATH")"
source /etc/os-release

function install_neovim() {
  ln -sf $BASE_DIR/vim $HOME/.config/nvim
  if ! command -v "nvim" &>/dev/null; then
    # dpp.vimが0.10.0以上でしか動作しないため
    # neovim 0.10.0がリリースされたら、パッケージ管理システムもサジェスト
    echo 'Info: Neovim Installing'
    echo '$ git clone https://github.com/SOmura-KIT/install-scirpts ~/repo'
    echo '$ cd repo'
    echo '$ bash install.sh'
  fi
}

function install_vim() {
  ln -sf $BASE_DIR/vim $HOME/.vim
  if ! command -v "vim" &>/dev/null; then
    echo 'Info: Vim Installing'
    case "$ID" in
      "arch")
        echo '  $ sudo pacman -S vim'
        ;;
      "debian")
        echo '  $ sudo apt install vim'
        ;;
      *)
        echo "  use your package manager or build https://github.com/vim/vim"
    esac
  fi
}

function install_alacritty() {
  ln -sf $BASE_DIR/alacritty $HOME/.config/.
  if [ ! -d "$BASE_DIR/alacritty/alacritty-theme" ]; then
    git clone https://github.com/alacritty/alacritty-theme $BASE_DIR/alacritty/alacritty-theme
  fi

  if ! command -v "alacritty" &>/dev/null; then
    echo 'Info: Alacritty Installing'
    case "$ID" in
      "arch")
        echo '  $ sudo pacman -S alacritty'
        ;;
      "debian")
        echo '  $ sudo apt install alacritty'
        ;;
      *)
        echo "use your package manager"
    esac
  fi
}

function install_i3() {
  ln -sf $BASE_DIR/i3 $HOME/.config/.
  if ! command -v "i3" &>/dev/null; then
    echo 'Info: i3 Installing'
    case "$ID" in
      "arch")
        echo '  $ sudo pacman -S i3-wm'
        ;;
      "debian")
        echo '  $ sudo apt install <i3-wm|i3>'
        echo "  i3-wm pacckage has only i3. i3 package has dmenu, i3-lock and i3."
        ;;
      *)
        echo "use your package manager"
    esac
  fi
}

function install_polybar() {
  ln -sf $BASE_DIR/polybar $HOME/.config/.
  if ! command -v "polybar" &>/dev/null; then
    echo 'Info: Polybar Installing'
    case "$ID" in
      "arch")
        echo '  $ sudo pacman -S polybar'
        ;;
      "debian")
        echo '  $ sudo apt install polybar'
        ;;
      *)
        echo "  use your package manager"
    esac
  fi
}

function install_picom() {
  # デスクトップかラップトップかでglxとxrenderをかえたいから、コピーで
  cp $BASE_DIR/picom.conf $HOME/.config/.
  if ! command -v "picom" &>/dev/null; then
    echo 'Info: Picom Installing'
    case "$ID" in
      "arch")
        echo '  $ sudo pacman -S picom'
        ;;
      "debian")
        echo '  $ sudo apt install picom'
        ;;
      *)
        echo "  use your package manager"
    esac
    echo ""
    echo "Change ~/.config/picom.conf for your environment"
  fi
}

function install_tmux() {
  ln -sf $BASE_DIR/.tmux.conf $HOME/.
  if ! command -v "tmux" &>/dev/null; then
    echo 'Info: Tmux Installing'
    case "$ID" in
      "arch")
        echo '  $ sudo pacman -S tmux'
        ;;
      "debian")
        echo '  $ sudo apt install tmux'
        ;;
      *)
        echo "  use your package manager"
    esac
    echo ""
    echo "Info: Tmux Plugins Installing"
    echo "  <prefix>I in tmux"
  fi
}

function install_neofetch() {
  if [ ! -d $BASE_DIR/neofetch-themes ]; then
    git clone https://github.com/Chick2D/neofetch-themes/ $BASE_DIR/neofetch-themes
  fi
  if [ ! -f $HOME/neofetch/config.conf ]; then
    mv $HOME/.config/neofetch/config.conf $HOME/.config/neofetch/config.conf.backup
  fi
  ln -sf $BASE_DIR/neofetch-themes/normal/ozozfetch.conf $HOME/.config/neofetch/config.conf
  if ! command -v "neofetch" &>/dev/null; then
    echo 'Info: Neofetch Installing'
    case "$ID" in
      "arch")
        echo '  $ sudo pacman -S neofetch'
        ;;
      "debian")
        echo '  $ sudo apt install neofetch'
        ;;
      *)
        echo "  use your package manager"
    esac
  fi
}

function install_wezterm() {
  ln -sf $BASE_DIR/.wezterm.lua $HOME/.
  if ! command -v "zsh" &>/dev/null; then
    echo 'Info: Wezterm Installing'
    case "$ID" in
      "arch")
        echo '  $ sudo pacman -S Wezterm'
        ;;
      "debian")
        echo '  $ sudo apt install Wezterm'
        ;;
      *)
        echo "  use your package manager"
    esac
  fi
}


function install_zsh() {
  ln -sf $BASE_DIR/.zshrc $HOME/.
  ln -sf $BASE_DIR/zsh $HOME/.
  git clone https://github.com/yuki-yano/zeno.zsh.git $BASE_DIR/zsh/zeno
  if ! command -v "zsh" &>/dev/null; then
    echo 'Info: Zsh Installing'
    case "$ID" in
      "arch")
        echo '  $ sudo pacman -S zsh'
        ;;
      "debian")
        echo '  $ sudo apt install zsh'
        ;;
      *)
        echo "  use your package manager"
    esac
    echo '  $ chsh "$(which zsh)"'
  fi
}

install_target="$1"
case "$install_target" in
  "nvim")
    install_neovim
    ;;
  "vim")
    install_vim
    ;;
  "alacritty")
    install_alacritty
    ;;
  "i3")
    install_i3
    ;;
  "polybar")
    install_polybar
    ;;
  "picom")
    install_picom
    ;;
  "tmux")
    install_tmux
    ;;
  "neofetch")
    install_neofetch
    ;;
  "wezterm")
    install_wezterm
    ;;
  "zsh")
    install_zsh
    ;;
  "all")
    isntall_neovim
    echo ""
    isntall_vim
    echo ""
    isntall_i3
    echo ""
    isntall_polybar
    echo ""
    isntall_picom
    echo ""
    isntall_tmux
    echo ""
    install_zsh
    ;;
  *)
    echo '$ bash install.sh <nvim|vim|i3|polybar|picom|neofetch|tmux|wezterm|zsh|all>'
    ;;
esac
