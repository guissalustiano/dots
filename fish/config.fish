if status is-interactive
    # Commands to run in interactive sessions can go here
end

/opt/homebrew/bin/brew shellenv | source
source ~/dots/fish/aliases.fish

fish_add_path ~/bin # scripts
fish_add_path /opt/homebrew/opt/rustup/bin
fish_add_path /Applications/Docker.app/Contents/Resources/bin/
fish_add_path ~/.cargo/bin # Rust

starship init fish | source # starship
zoxide init fish | source # zoxide
# kubectl completion fish | source # kubectl
