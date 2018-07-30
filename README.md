# Vimrc

## Env and usage

#### This vimrc is provide for golang, C/C++ or python programmer.

SYSTEM:

- Ubuntu-16.04 LTS
- Debain-9

LANGUAGE:

- golang 1.10+
- python 3.5+
- C++ 11

## Install vim8+

```bash

sudo su -

apt-get install -y build-essential python3-dev libclang-dev cmake
apt-get remove --auto-remove vim -y
add-apt-repository ppa:jonathonf/vim -y
apt-get update
apt-get install vim

```

## Install plugins

```bash

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/kidrocknroll/vimrc.git ~/.vim/vimrc && mv ~/.vim/vimrc/vimrc ~/.vimrc
git clone https://github.com/tomasr/molokai /usr/share/vimcolors
ln -sv /usr/share/vimcolors/colors/molokai.vim /usr/share/vim/vim81/colors/molokai.vim

vim command:
	:PluginInstall

cd ~/.vim/bundle/YouCompleteMe/
python3 install.py --clang-completer --go-completer --system-libclang

# if failed by timeout error :
# while [[ 1 ]]; do git submodule update --init --recursive; if [[ $? -eq 0 ]]; then break; fi; done &

```
