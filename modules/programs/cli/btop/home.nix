{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.btop = {
    enable = true;
    # Theme handled by Stylix - removed manual color config to avoid conflicts
  };
}
