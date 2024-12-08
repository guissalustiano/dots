if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/dots/fish/aliases.fish


fish_add_path ~/.cargo/bin # Rust
fish_add_path ~/go/bin # go
fish_add_path ~/bin # scripts
fish_add_path /opt/google-cloud-cli/bin # gcloud
fish_add_path ~/dev/flutter/bin
fish_add_path ~/.local/bin # Python
fish_add_path ~/bin/google-cloud-sdk/bin

# Android
fish_add_path /home/guiss/Android/Sdk/platform-tools/
fish_add_path /home/guiss/Android/Sdk/
fish_add_path /home/guiss/Android/Sdk/cmdline-tools/latest/bin/

starship init fish | source # starship
zoxide init fish | source # zoxide
#atuin init fish | source # atuin
kubectl completion fish | source # kubectl
source $HOME/.grit/bin/env.fish


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/guiss/bin/google-cloud-sdk/path.fisn.inc' ]
    . '/home/guiss/bin/google-cloud-sdk/path.fisn.inc'
end

# The next line enables shell command completion for gcloud.
if [ -f '/home/guiss/bin/google-cloud-sdk/completion.fisn.inc' ]
    . '/home/guiss/bin/google-cloud-sdk/completion.fisn.inc'
end
