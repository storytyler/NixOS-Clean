{
  lib,
  pkgs,
  browser,
  terminal,
  terminalFileManager,
  kbdLayout,
  kbdVariant,
  inputs,
  ...
}: {
  imports = [
    # System and theming
    ../themes/stylix.nix # Automated theming via Stylix
    ./system.nix           # System-level Hyprland services
    
    # Supporting programs (system-level only, no conflicts)
    ./programs/waybar
    ./programs/wlogout
    ./programs/rofi
    ./programs/hypridle
    ./programs/hyprlock
    ./programs/swaync
    # ./programs/dunst  # Handled via home-profiles.nix to avoid conflicts
  ];
  
  # All system services now handled by system.nix
  # All user config now handled by user.nix (imported via home-profiles.nix)
}