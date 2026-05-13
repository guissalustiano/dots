{ config, pkgs, lib, ... }:

let
  isGui = builtins.pathExists /run/opengl-driver;
  sessionVars = {
    EDITOR = "hx";
  };
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

  home.file.".terminfo/x/xterm-ghostty".source = "${pkgs.ghostty}/share/terminfo/x/xterm-ghostty";

  home.file.".claude/CLAUDE.md".text = ''
    # Global Claude Code Instructions

    ## System configuration

    This machine is managed with **Home Manager (Nix)**. The configuration file is:

    ```
    ~/.config/home-manager/home.nix
    ```

    When asked to install packages, change shell settings, configure tools, or adjust the environment, prefer editing `home.nix` and applying with `home-manager switch` (aliased as `hms`).

    ## Project-specific dependencies

    Projects use a `default.nix` (or `shell.nix`) in the project root for per-project dependencies, managed via **direnv** (`use nix` in `.envrc`). When a project needs a tool or library, add it to that project's `default.nix` rather than to `home.nix`.
  '';

  home.sessionVariables = sessionVars;

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

  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
  };

  programs.ghostty = lib.mkIf isGui {
    enable = true;
    settings = {
      command = "${pkgs.nushell}/bin/nu";
      background-opacity = 0.9;
    };
  };

  programs.zellij = {
    enable = true;
    settings = {
      default_shell = "${pkgs.nushell}/bin/nu";
      default_layout = "compact";
      default_mode = "locked";
      show_startup_tips = false;
    };
  };

  programs.nushell = {
    enable = true;
    environmentVariables = sessionVars;
    shellAliases = {
      hms = "home-manager switch";
    };
    extraConfig = ''
      source ${pkgs.runCommand "jj-completions-nu" { buildInputs = [ pkgs.jujutsu ]; } ''
        mkdir -p $out/share/nushell/vendor_autoload
        jj util completion nushell > $out/share/nushell/vendor_autoload/jj.nu
      ''}/share/nushell/vendor_autoload/jj.nu
      source ${pkgs.runCommand "just-completions-nu" { buildInputs = [ pkgs.just ]; } ''
        mkdir -p $out/share/nushell/vendor_autoload
        just --completions nushell > $out/share/nushell/vendor_autoload/just.nu
      ''}/share/nushell/vendor_autoload/just.nu
    '';
  };

  programs.direnv = {
    enable = true;
    enableNushellIntegration = true;
    nix-direnv.enable = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
