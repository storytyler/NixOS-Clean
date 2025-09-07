{
  config,
  lib,
  pkgs,
  ...
}: {
  # Let Stylix handle swaylock theming with Dracula colors
  # Removed manual config to avoid conflicts
  programs.swaylock.enable = true;
  programs.wlogout.enable = true;
}
