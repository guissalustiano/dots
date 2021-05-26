source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit ice blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

autoload compinit
compinit

zinit light zdharma/fast-syntax-highlighting

zinit light zsh-users/zsh-autosuggestions

zinit light zinit-zsh/z-a-rust \
zinit light zinit-zsh/z-a-as-monitor \
zinit light zinit-zsh/z-a-patch-dl \
zinit light zinit-zsh/z-a-bin-gem-node
