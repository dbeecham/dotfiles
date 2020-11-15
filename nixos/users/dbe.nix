inputs: { pkgs, ... }: {

  users.users.dbe = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
    passwordFile = "/etc/nixos/dbe.passwd";
    uid = 1000;
    shell = pkgs.zsh;
    packages = with pkgs; [ 
      # rice
      rofi polybar apvlv
      inputs.st.defaultPackage.x86_64-linux
      synergy
      xautolock
      i3lock-fancy-rapid
      dunst
      compton
      libnotify # fot notify-send

      # os stuff
      opensc # for pkcs11 cards (yubikey, yubihsm)
      linuxPackages.bcc # execsnoop, bindsnoop, exitsnoop, tcptop, cpudist, many, many others
      xsel
      duc # disk usage indexer
      google-chrome
      smartmontools # disk health stuff
      e2fsprogs # badblocks, e2fsck, tune2fs, chattr, mkfs.ext*
      yubikey-manager
      cryptsetup
      iptables
      qemu
      ext4magic

      # backup
      restic
      ddrescue ddrescueview

      # development
      (vim_configurable.override { python = python39; })
      bear
      cscope
      ctags
      gnumake
      gcc
      entr
      cookiecutter
      docker-compose
      git github-cli pass gnupg pinentry-curses ccls shellcheck
      nodejs python39
      minicom
      sqlite
      awscli
      pgcli
      postgresql
      fly
      terraform
      gdb
      pwgen
      keybase kbfs
      #arduino-cli
      ghidra-bin radare2 radare2-cutter
      valgrind
      aflplusplus

      # linters
      python38Packages.cfn-lint

      # general cli
      psmisc # for 'fuser', 'killall', 'pstree', 'peekfd', 'prtstat'
      moreutils # for 'ts', 'sponge', 'errno', 'ifdata' and others
      inputs.local.rip # better rm
      inputs.local.dog # better dig
      bat # better cat
      broot # file manager
      lsof
      htop
      socat
      manpages
      kubectl
      tmux 
      ripgrep ripgrep-all # better grep/ag
      fzf
      fd # better find
      file
      direnv
      atool unzip
      tcpdump
      wireshark

      # mail
      msmtp # to send mail
      mailutils # uses msmtp to send mail
      lieer # to sync with gmail
      notmuch # to index 
      neomutt # to read using tui

      # network
      httpie
      jq
      stunnel
      gnutls
      openssl
      nmap
      testssl # testssl.sh
      wget # scripts use this sometimes
      bind # for dig

      ncat
      bandwhich
      iftop
      ferm
      ngrok
      fping

      p0f
      bettercap
      dsniff
      sniffglue
      burpsuite
      dirb gobuster
      spike

      # graphics
      blender

      # exploiting stuff
      #metasploit
      sqlmap
      brutespray
      hashcat hashcat-utils john 
      wpscan zap

    ];
  };

}
