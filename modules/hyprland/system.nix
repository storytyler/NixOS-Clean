{
  lib,
  pkgs,
  inputs,
  ...
}: {
  # System-level Hyprland configuration
  # Handles services, display manager, and system packages
  
  # Nix substituters for Hyprland cache
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  # Polkit authentication agent for system operations
  systemd.user.services.hyprpolkitagent = {
    description = "Hyprpolkitagent - Polkit authentication agent";
    wantedBy = ["graphical-session.target"];
    wants = ["graphical-session.target"];
    after = ["graphical-session.target"];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  # Enable Hyprland system service and set as default session
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    # withUWSM = true;
  };
  
  # Enable SDDM display manager with theme support
  services.displayManager = {
    sddm = {
      enable = true;
      # Theme configuration will be handled by user's theme selection
    };
    defaultSession = "hyprland";
  };
  
  # Enable X11 for SDDM (required)
  services.xserver.enable = true;

  # System packages for Hyprland (packages only - no configuration)
  environment.systemPackages = with pkgs; [
    # Core Hyprland tools
    hyprpaper
    hyprpicker
    cliphist
    grimblast
    swappy
    libnotify
    brightnessctl
    networkmanagerapplet
    pamixer
    pavucontrol
    playerctl
    waybar
    wtype
    wl-clipboard
    xdotool
    yad
    socat # for autowaybar.sh
  ];

  # Hyprland plugins via shared modules - minimal config to avoid conflicts
  # NOTE: Re-enabling plugins to test current compatibility
  home-manager.sharedModules = [
    ({...}: {
      # Only set plugins here - all other config in user.nix
      wayland.windowManager.hyprland.plugins = with inputs.hyprland-plugins.packages.${pkgs.system}; [
        borders-plus-plus    # Enhanced borders with RGB gradients
        hyprwinwrap         # Desktop widgets & animated wallpapers
        # hyprexpo            # Disabled - command not working
      ];
    })
  ];
}