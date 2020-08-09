# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
inputs: { pkgs, ... }:

let
  l_gnupg =  pkgs.symlinkJoin {
    name = "gnupg";
    paths = [ pkgs.gnupg ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/gpg --set SSH_AUTH_SOCK '/run/user/$UID/gnupg/gpg-agent.sock'
      wrapProgram $out/bin/gpg-agent --set SSH_AUTH_SOCK '/run/user/$UID/gnupg/gpg-agent.sock'
    '';
  };

in
{

  nix.package = pkgs.nixUnstable;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "doppy"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp3s0.useDHCP = true;

  services.udev.packages = [ pkgs.yubikey-personalization ];
  services.pcscd.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   wget vim
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "gnome3";
  };

  # List services that you want to enable:

  #export HELLOTHERE="${dotfiles}/hi"
  # environment has a variables thing as well
  environment.shellInit = ''
    export GPG_TTY="$(tty)"
    gpg-connect-agent /bye
  '';

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 24800 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "se";
  services.xserver.xkbOptions = "caps:escape";

  services.xserver.windowManager.bspwm.enable = true;

  virtualisation.docker.enable = true;

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.jane = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  # };
  nixpkgs.config.allowUnfree = true;
  programs.zsh.enable = true;
  users.mutableUsers = false;
  users.users.dbe = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
    passwordFile = "/etc/nixos/dbe.passwd";
    uid = 1000;
    shell = pkgs.zsh;
    packages = with pkgs; [ 
      rofi polybar apvlv
      synergy
      (vim_configurable.override { python = python39; })
      git github-cli pass l_gnupg pinentry-curses ccls cquery shellcheck
      ripgrep ripgrep-all
      docker-compose
      fzf fd
      file
      xsel
      httpie
      jq
      entr
      tmux minicom
      sqlite duc
      opensc
      google-chrome
      nodejs python39
      awscli
      direnv

      socat

      # for the 'ts' cli utility
      moreutils

      gnumake gcc

      inputs.local.packages.x86_64-linux.rip

      (st.override { 
        patches = [ ../../st/st-scrollback-0.8.2.diff ];
        conf = builtins.readFile ../../st/config.h; 
      })

    ];
  };

  fonts.fonts = with pkgs; [ 
    ubuntu_font_family mononoki noto-fonts-cjk
  ];

  programs.ssh.startAgent = true;
  programs.ssh.agentPKCS11Whitelist = "${pkgs.opensc}/lib/opensc-pkcs11.so";
  programs.ssh.extraConfig = "PKCS11Provider ${pkgs.opensc}/lib/opensc-pkcs11.so";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?

}
