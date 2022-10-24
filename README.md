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
以下コマンドでDenoをインストール
```sh
curl -fsSL https://deno.land/install.sh | sh
```
インストールが終わったら、以下コマンドを`.bashrc`に追記
```bashrc
export DENO_INSTALL="/home/<user>/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
```
以下コマンドを実行して、[Welcome to Deno!]が帰ってくればインストール成功
```sh
deno run https://deno.land/std@0.160.0/examples/welcome.ts
```
```sh
Welcome to Deno!
```

## .vimrcをクローン
```sh
git clone 
