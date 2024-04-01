if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/dots/fish/aliases.fish


fish_add_path ~/.cargo/bin # Rust
fish_add_path ~/.local/bin # Python

starship init fish | source # starship
zoxide init fish | source # zoxide
direnv hook fish | source # direnv
atuin init fish | source # atuin
