# dotfiles
| 設定のバックアップ

## メモ
### Neovim
* luaよりvimscriptの方が書きやすいから、基本そっち

### Polybar
* adi1090x/polybar-themesを使用

### alacritty
* alacritty/alacritty-themeを使用

### neofetch
* Chick2D/neofetch-themesを使用

## 継続
### Neovim
* latexとかのチートシートとかをhelpfileで作成
* ddu関係を充実させる
* スニペットの充実

## 問題
### Neovim
* autocmd User DenopsReady call dpp#make_state(s:dpp_base, '{TypeScript config file path}')が成功しない(手打ちだと成功する)ので、修正必須

## ToDo
### Polybar
* [ ] polybarのテーマでコピーを使用しているので、install.shでgit cloneを行うようにする

### Zshrc
* [x] ディストリビューションやコマンドの有無の確認をするようにする

### Neovim
* [x] dppへの移行
* [ ] j, kでの移動カーソルが下から3, 4行目くらいになるようにする(Astrovimみたいな感じ)
* [x] <数字>j, kのときのgj gkへのマップの無効化
* [x] Git関係のプラグインを何か導入(候補: Gin)
* [x] ddcのTypeScript移行
* [x] dduのTypeScript移行
* [x] dppの遅延読み込みで、dpp_ext_installerなどが読みこまれていない問題の解消
* [x] 非nvim環境用のvim.tomlを作成
* [ ] vim/nvimディストリビューションをいくつか使ってみて、面白そうな機能を引っ張ってきたい
* [ ] ddcを充実。前の環境でddcのskkeletonとddc-source-cpilotの噛み合せが悪かったから、調整必要。
* [ ] ddcでhas("nvim")
