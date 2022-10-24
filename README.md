# vimrc
## 前準備
Vimをインストール
```sh
sudo apt install vim
```
plug.vimをインストール
```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
jediをインストール
```sh
pip install jedi
```
前準備終わり


## Denoをインストール
Denoをインストール
```sh
curl -fsSL https://deno.land/install.sh | sh
```
インストールが終わったら、パスの設定を`.bashrc`に追記
```bashrc
export DENO_INSTALL="~/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
```
以下コマンドを実行して、[Welcome to Deno!]が帰ってくればインストール成功
```sh
deno run https://deno.land/std@0.160.0/examples/welcome.ts
```
```sh
Welcome to Deno!
```

## .vimrcの設定
以下コマンドでリポジトリをクローンし、ホームディレクトリに`.vimrc`を移動
```sh
cd ~/
git clone https://github.com/HappyYusuke/vimrc.git
mv ~/vimrc/.vimrc .
```
</br>

## プラグインをインストール
.vimrcを開く
```sh
vim ~/.vimrc
```
vimコマンドでプラグインをインストール
```vim
:PlugInstall
```
JEDI-VIMの確認
```vim
:help jedi-vim
```
画像のように表示されたら成功
<img src="https://user-images.githubusercontent.com/82449194/197625826-4a8acd37-0f39-47a7-a25e-521c15bd713b.png" width=600>I
</br>

## カラースキームの設定
.vimにディレクトリ作成、移動
```sh
mkdir ~/.vim/colorscheme && mkdir ~/.vim/colors
cd ~/.vim/colorscheme
```
公開されているカラースキームをクローン
```sh
git clone https://github.com/morhetz/gruvbox.git
```
```sh
git clone https://github.com/altercation/vim-colors-solarized.git
```
```sh
git clone https://github.com/w0ng/vim-hybrid.git
```
```sh
git clone https://github.com/gosukiwi/vim-atom-dark.git
```
```sh
git clone https://github.com/jacoborus/tender.vim.git
```
```sh
git clone https://github.com/raphamorim/lucario.git
```
```sh
git clone https://github.com/jonathanfilip/vim-lucius.git
```
colorsのファイルを移動
```sh
mv ~/.vim/colorscheme/gruvbox/colors/gruvbox.vim ~/.vim/colorscheme/lucario/colors/lucario.vim ~/.vim/colorscheme/tender.vim/colors/tender.vim ~/.vim/colorscheme/vim-atom-dark/colors/atom-dark.vim ~/.vim/colorscheme/vim-colors-solarized/colors/solarized.vim ~/.vim/colorscheme/vim-hybrid/colors/hybrid.vim ~/.vim/colorscheme/vim-lucius/colors/lucius.vim ~/.vim/colors
```
</br>

## GNOMEの設定（任意）
GNOME用のSolarizedをインストール
```sh
cd ~/.vim/colorscheme
git clone https://github.com/aruhier/gnome-terminal-colors-solarized.git
```
スクリプトの実行
```sh
cd gnome-terminal-colors-solarized
./install.sh
```
自分好みの設定にする
<img src="https://user-images.githubusercontent.com/82449194/197632872-872950b3-1919-4c69-a8d5-81ad08f270ab.jpg" width=600>
