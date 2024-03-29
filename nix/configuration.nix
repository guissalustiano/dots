# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      <home-manager/nixos>
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # services.xserver.displayManager.defaultSession = "plasmawayland";

  # Configure keymap in X11
  services.xserver = {
    layout = "br";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (pkg: true);

  # License for segger jlink
  nixpkgs.config.segger-jlink.acceptLicense = true;


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.guiss = {
    isNormalUser = true;
    description = "guiss";
    extraGroups = [ "networkmanager" "wheel" "dialout" "docker"];
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "guiss";


  # Home manger config
  home-manager.users.guiss = { pkgs, ... }: {
    home.stateVersion = "23.05";

    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.allowUnfreePredicate = (pkg: true);

    home.packages = with pkgs; [
      zsh
      niv
      direnv
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
      tealdeer
  
      spotify
      firefox
      obsidian
      
      dbeaver

      vscode
      elixir_1_15
      erlang
      elixir-ls
      inotify-tools
      lua-language-server
      gcc
      gnumake
      nodejs # For nvim copilot

      archi
    ];

    programs.bash.enable = false;
  
    programs.git = {
      enable = true;
      userName = "Guilherme Salustiano";
      userEmail = "guissalustiano@gmail.com";
    };
  
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        nxs = "nix-shell";
        ll = "ls -l";
        update = "sudo nixos-rebuild switch";
        upgrade = "sudo nixos-rebuild switch --upgrade";
        docker-runb = "docker run --rm -it $(docker build -q .)"
      };
  
      zplug = {
        enable = true;
        plugins = [
          { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
          { name = "plugins/git"; tags = ["from:oh-my-zsh"]; }
          { name = "plugins/docker"; tags = ["from:oh-my-zsh"]; }
          { name = "chisui/zsh-nix-shell"; tags = ["at:v2.4.2"]; }
        ];
      };
  
      initExtra = ''
        eval "$(starship init zsh)"
        eval "$(zoxide init zsh)"
        . "$HOME/.asdf/asdf.sh"
      '';
    };
  };

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    steam
    neovim
    docker-compose
  ];


  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  environment.variables.EDITOR = "nvim";

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];

  # Docker config
  virtualisation = {
    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

    services.udev.extraRules = ''
    # 71-nrf.rules
    ACTION!="add", SUBSYSTEM!="usb_device", GOTO="nrf_rules_end"

    # Set /dev/bus/usb/*/* as read-write for all users (0666) for Nordic Semiconductor devices
    SUBSYSTEM=="usb", ATTRS{idVendor}=="1915", MODE="0666"

    # Flag USB CDC ACM devices, handled later in 99-mm-nrf-blacklist.rules
    # Set USB CDC ACM devnodes as read-write for all users
    KERNEL=="ttyACM[0-9]*", SUBSYSTEM=="tty", SUBSYSTEMS=="usb", ATTRS{idVendor}=="1915", MODE="0666", ENV{NRF_CDC_ACM}="1"

    LABEL="nrf_rules_end"
    '';
}
