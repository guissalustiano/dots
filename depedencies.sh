
pacman -S git alac
pacman -S hyprland alacritty # wayland tilling windows manager

pacman -S paru # AUR manager

paru -S neovim

# hyprland complements
paru -S mako
paru -S xdg-desktop-portal-hyprland xdg-desktop-portal-gtk # Because XDPH don't implement file picker
paru -S qt5-wayland qt6-wayland
paru -S waybar tofi swww


# Dev stuff
## Terminal

paru -S ripgrep bat bottom eza fd

#
paru -S zsh

echo ". /opt/asdf-vm/asdf.sh" >> ~/.zshrc
paru -S asdf

asdf add plugin elixir
asdf install elixir latest
asdf global elixir latest

paru -S nodejs
paru -S python poetry
