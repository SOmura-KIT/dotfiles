# dotfiles
| 設定のバックアップ

## メモ
### Neovim
* luaよりvimscriptの方が書きやすいから、基本そっち

### Polybar
* adi1090x/polybar-themesを使用

### alacritty
* alacritty/alacritty-themesを使用

## 継続
### Neovim
* latexとかのチートシートとかをhelpfileで作成
* ddu関係を充実させる

## 問題
### Neovim
* ddc-source-nvim-lsp-setupを読み込んだ後にlspのsetupメソッドを読み込まないといけない。LSPの有効化のタイミングをどのタイミングにするか。

## ToDo
### Neovim
* [x] dppへの移行
* [ ] j, kでの移動カーソルが下から3, 4行目くらいになるようにする(Astrovimみたいな感じ)
* [x] <数字>j, kのときのgj gkへのマップの無効化
* [x] Git関係のプラグインを何か導入(候補: Gin)
* [x] ddcのTypeScript移行
* [x] dduのTypeScript移行
* [x] dppの遅延読み込みで、dpp_ext_installerなどが読みこまれていない問題の解消
* [ ] 非nvim環境用のvim.tomlを作成
* [ ] vim/nvimディストリビューションをいくつか使ってみて、面白そうな機能を引っ張ってきたい
* [ ] ddcを充実。前の環境でddcのskkeletonとddc-source-cpilotの噛み合せが悪かったから、調整必要。
