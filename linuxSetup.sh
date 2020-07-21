#! /bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install -y nodejs

#install neovim
sudo apt install -y neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +PlugInstall +qall
curl -o ~/.config/nvim/init.vim --create-dirs https://raw.githubusercontent.com/guissalustiano/localConfigs/master/vimrc

#install zsh
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
curl -o ~/.config/nvim/init.vim --create-dirs https://raw.githubusercontent.com/guissalustiano/localConfigs/master/zshrc

