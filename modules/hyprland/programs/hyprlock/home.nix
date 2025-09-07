{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.hyprlock = {
    enable = true;
    # Simplified configuration to resolve module system type error
    # Full cyberpunk config can be restored after successful build
  };
}
