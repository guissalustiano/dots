{ config, pkgs, lib, ... }:

let
  isGui = builtins.pathExists /run/opengl-driver;
in
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "claude-code"
    "obsidian"
  ];

  home.username = "salust";
  home.homeDirectory = "/home/salust";

  home.stateVersion = "25.11";

  home.packages = [
    pkgs.eza
    pkgs.claude-code
  ] ++ lib.optionals isGui [
    pkgs.obsidian
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "hx";
  };

  programs.git = {
    enable = true;
    settings.user = {
      name = "Guilherme Stabach Salustiano";
      email = "guissalustiano@gmail.com";
    };
  };

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Guilherme Stabach Salustiano";
        email = "guissalustiano@gmail.com";
      };
    };
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "base16_transparent";
      editor.line-number = "relative";
    };
  };

  programs.zsh = {
    enable = true;
    initContent = ''
      if [ -e /nix/var/nix/profiles/default/etc/profile.d/nix.sh ]; then
        source /nix/var/nix/profiles/default/etc/profile.d/nix.sh
      fi
    '';
    shellAliases = {
      ls   = "eza";
      ll   = "eza -l";
      la   = "eza -la";
      gst  = "git status";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.ghostty = lib.mkIf isGui {
    enable = true;
    settings = {
      shell-integration = "zsh";
      shell-integration-features = "ssh-terminfo,ssh-env";
      command = "${pkgs.zsh}/bin/zsh";
      background-opacity = 0.9;
    };
  };

  programs.zellij = {
    enable = true;
    settings = {
      default_shell = "${pkgs.zsh}/bin/zsh";
      default_layout = "compact";
      default_mode = "locked";
    };
  };

  programs.nushell = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
