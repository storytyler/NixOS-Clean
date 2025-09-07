{
  lib,
  pkgs,
  ...
}: {
  # System-level concerns only: fonts and packages
  fonts.packages = with pkgs.nerd-fonts; [jetbrains-mono];
  
  # Alacritty configuration now handled entirely via Home Manager in home.nix
  # This avoids conflicts between system and user-level configs (and Stylix)
}