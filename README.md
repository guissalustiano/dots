# Meu Arch

## Linux Shell
### Specs
 - zsh
 - oh- my-zsh

### Instalation
```bash
  $ sudo pacman -S zsh # isntall zsh 
  $ chsh -s $(which zsh)
  
  # install Oh-my-zsh
  $ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  
  # install spaceship
  $ git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
  $ ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
  
  #Install zinit
  $ sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
  
  # Change .ashrv
  $ curl -o .zshrc https://raw.githubusercontent.com/guissalustiano/localConfigs/master/zshrc
```

## Terminal
### Specs
  - Kity
### Instalation
```bash
  $ sudo pacman -Sy ttf-fira-code
```
