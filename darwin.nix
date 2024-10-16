{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [
    pkgs.ffmpeg_7-headless
    pkgs.git
    pkgs.goldendict
    pkgs.iterm2
    pkgs.mc
    pkgs.nano
    pkgs.pipx
    pkgs.screen
    pkgs.wget
    pkgs.whatsapp-for-mac
    pkgs.xquartz
    pkgs.yt-dlp
    pkgs.zsh
    pkgs.zsh-autosuggestions
    pkgs.zsh-completions
    pkgs.zsh-syntax-highlighting
    ];


  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix = {
    package = pkgs.nix;
    settings = {
      "extra-experimental-features" = [ "nix-command" "flakes" ];
    };
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  homebrew = {
    enable = true;

    casks = [
      "coteditor"
      "firefox"
      "parsec"
      "signal"
    ];

    masApps = {
      "Amphetamine" = 937984704;
      "Onedrive" = 823766827;
      "Infuse" = 1136220934;
      "Word" = 462054704;
    };
  };

  system.defaults = {
    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      FXEnableExtensionChangeWarning = false;
    };
    
  };
}
