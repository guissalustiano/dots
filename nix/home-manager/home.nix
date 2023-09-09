{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "guiss";
  home.homeDirectory = "/home/guiss";

  nixpkgs.config.allowUnfreePredicate = (pkg: true);

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    zsh
    git

    htop
    zip
    unzip

    xclip

    alacritty
    zellij
    starship
    zoxide
    fzf
    ripgrep
    bat
    tio
    eza

    spotify
    firefox
    steam
    obsidian
    
    # For nvim copilot
    nodejs
    elixir
    inotify-tools

  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Guilherme Salustiano";
    userEmail = "guissalustiano@gmail.com";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch && home-manager switch";
    };

    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.7.0";
          sha256 = "149zh2rm59blr2q458a5irkfh82y3dwdich60s9670kl3cl5h2m1";
        };
      }
    ];

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
      ];
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "docker"];
      theme = "robbyrussell";
    };

    initExtra = ''
      eval "$(starship init zsh)"
    '';
  };
}
