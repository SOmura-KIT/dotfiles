# *** dotfilesディレクトリをホームディレクトリ上にして実行すること ***
# To-Do: ディレクトリ位置を意識しなくてもいいよう変更
ln -s $HOME/dotfiles/alacrity/  $HOME/.config/.
ln -s $HOME/dotfiles/i3/        $HOME/.config/.
ln -s $HOME/dotfiles/nvim/      $HOME/.config/.
ln -s $HOME/dotfiles/picom.conf $HOME/.config/.
ln -s $HOME/dotfiles/.tmux.conf $HOME/.
ln -s $HOME/dotfiles/.zshrc     $HOME/.
$ git clone --depth=1 https://github.com/adi1090x/polybar-themes.git $HOME/dotfiles/.
