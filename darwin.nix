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
    pkgs.wget
    pkgs.whatsapp-for-mac
    pkgs.xquartz
    pkgs.yt-dlp
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

  #fonts.fontDir.enable = true;
  #fonts.fonts = [
   # pkgs.monaspace
 # ];

  homebrew = {
    enable = true;

    casks = [
      "firefox"
      "signal"
    ];

    masApps = {
      "Amphetamine" = 937984704;
      "Infuse" = 1136220934;
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
