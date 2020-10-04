# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/guiss/.oh-my-zsh"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit ice depth=1; zinit light romkatv/powerlevel10k

#export LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

source $(dirname $(gem which colorls))/tab_complete.sh

export PATH=/home/guiss/.yarn/bin:$PATH
export PATH=/home/guiss/.gem/ruby/2.7.0/bin:$PATH
export PATH=/home/guiss/.local/bin:$PATH
export PATH=/opt/android-sdk/cmdline-tools/latest/bin:$PATH

alias get='sudo pacman -S'
alias vi='nvim'
alias ls="colorls"
alias icat="kitty +kitten icat"
alias clip="kitty +kitten clipboard"
# alias cat="bat"
alias audio="sudo alsamixer"
alias baterry="upower -d"
alias serve="browser-sync start -s -f ."
alias gs="git status"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# [[ $TERM != "screen" ]] && exec tmux

# flutter
export ANDROID_SDK_ROOT=/opt/android-sdk
export ANDROID_HOME=/opt/android-sdk
