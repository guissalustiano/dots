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
fish_add_path ~/.pub-cache/bin # Flutter

# Android
fish_add_path /home/guiss/Android/Sdk/platform-tools/
fish_add_path /home/guiss/Android/Sdk/
fish_add_path /home/guiss/Android/Sdk/cmdline-tools/latest/bin/

starship init fish | source # starship
zoxide init fish | source # zoxide
#atuin init fish | source # atuin
kubectl completion fish | source # kubectl
