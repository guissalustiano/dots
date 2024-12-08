alias ls="eza"
alias ll="eza -l"
alias la="eza -la"
alias tree="eza -tree"

# Editor
#alias hx="helix"

abbr -a vitw -- vi ~/dots/hyprland.conf


# Git
abbr -a -- g git
abbr -a -- ga 'git add -p'
abbr -a -- gc 'git commit -v'
abbr -a -- gc! 'git commit --verbose --amend'
abbr -a -- gcn! 'git commit --verbose --no-edit --amend'
abbr -a -- gco 'git checkout'
abbr -a -- gcb 'git pull --rebase --autostash && git checkout -b'
abbr -a -- gd 'git diff'
abbr -a -- gds 'git diff --staged'
abbr -a -- glog 'git log --oneline --decorate --color --graph'
abbr -a -- gp 'git push'
abbr -a -- gpf 'git push --force-with-lease'
abbr -a -- gpsup 'git push --set-upstream origin $(git branch 2> /dev/null | sed -e \'/^[^*]/d\' -e \'s/* \\(.*\\)/\\1/\')'
abbr -a -- gl 'git pull'
abbr -a -- grs 'git restore -p'
abbr -a -- grst 'git restore --staged -p'
abbr -a -- gst 'git status'
abbr -a -- gsta 'git stash'
abbr -a -- grb 'git rebase'
abbr -a -- grbi 'git rebase -i'
abbr -a -- grbc 'git rebase --continue'
abbr -a -- grba 'git rebase --abort'
abbr -a -- grbmain 'git fetch && git rebase $(git symbolic-ref refs/remotes/origin/HEAD --short)'
abbr -a -- grbimain 'git rebase -i $(git symbolic-ref refs/remotes/origin/HEAD --short)'
abbr -a -- gcomain 'git checkout $(git symbolic-ref refs/remotes/origin/HEAD --short)'
abbr -a -- gb 'git branch'

# Podman
abbr -a -- ppls 'podman pod ls'
abbr -a -- pplog 'podman pod logs --color --since 10m'
abbr -a -- ppstart 'podman pod start'
abbr -a -- ppstop 'podman pod stop'
abbr -a -- pcls 'podman container ls'
abbr -a -- pcx 'podman container exec'
abbr -a -- pcxit 'podman container exec -it'
