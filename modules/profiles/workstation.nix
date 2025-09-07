{
  config,
  lib,
  pkgs,
  machineConfig,
  videoDriver,
  browser,
  terminal,
  editor,
  terminalFileManager,
  ...
}:
with lib; {
  imports =
    [
      # Import hardware-specific modules based on configuration
      ../hardware/video/${videoDriver}.nix

      # Desktop environment
      ../hyprland

      # Core programs based on preferences
      ../programs/browser/${browser}
      ../programs/terminal/${terminal}
      ../programs/editor/${editor}
      ../programs/cli/${terminalFileManager}
      
      # File management
      ../programs/misc/thunar
      
      # Media applications  
      ../programs/media/youtube-music
      ../programs/media/mpv
      ../programs/media/thunderbird

      # Common CLI tools
      ../programs/cli/starship
      ../programs/cli/tmux
      ../programs/cli/direnv
      ../programs/cli/lazygit
      ../programs/cli/btop

      # Shell configuration
      ../programs/shell/${machineConfig.shell}

      # Development tools (if enabled)
    ]
    ++ (optionals machineConfig.features.development [
      ../programs/cli/direnv
      ../scripts
    ])
    ++ (optionals machineConfig.features.gaming [
      ../programs/games
    ])
    ++ (optionals machineConfig.features.multimedia [
      #  ../programs/media/spicetify
    ])
    ++ (optionals machineConfig.features.virtualization [
      ../programs/misc/virt-manager
    ]);

  # Workstation-specific packages
  environment.systemPackages = with pkgs;
    [
      # Productivity
      obsidian
      libreoffice
      starship
      # Creative tools
      krita
      gimp
      inkscape

      # Development
      github-desktop

      # System tools
      gparted
      # ventoy.1.1.05
    ]
    ++ (optionals machineConfig.features.development [
      vscode
      jetbrains.idea-community
      postman
    ]);

  # Workstation services
  services = {
    # Enable printing
    printing.enable = true;

   
        };

  hardware = {
    # Scanner support
    sane = {
      enable = true;
      extraBackends = [pkgs.sane-airscan];
    };
  };

  # Flatpak support for additional apps
  services.flatpak.enable = machineConfig.features.multimedia;

  # Performance optimizations for desktop
  powerManagement.cpuFreqGovernor = "performance";

  # Networking for workstation
  networking.networkmanager.enable = true;
  
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [];
    allowedUDPPorts = [];
  };
}
