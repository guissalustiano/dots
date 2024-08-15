if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/dots/fish/aliases.fish


fish_add_path ~/.cargo/bin # Rust
fish_add_path ~/.local/bin # Python
fish_add_path ~/go/bin # go
fish_add_path ~/bin # scripts
fish_add_path /opt/google-cloud-cli/bin # gcloud

# Android
set -gx ANDROID_HOME /opt/android-sdk
fish_add_path $ANDROID_HOME/platform-tools/
fish_add_path $ANDROID_HOME/tools/bin/
fish_add_path $ANDROID_HOME/tools/

starship init fish | source # starship
zoxide init fish | source # zoxide
direnv hook fish | source # direnv
atuin init fish | source # atuin
kubectl completion fish | source # kubectl
helm completion fish | source # helm
