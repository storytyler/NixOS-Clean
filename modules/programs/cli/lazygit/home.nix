{
  config,
  lib,
  pkgs,
  ...
}: {
  home.shellAliases = {
    lg = "lazygit";
  };
  programs.lazygit = {
    enable = true;
    settings = {
      # Let Stylix handle theming automatically with Dracula colors
      # Removed manual catppuccin theme to avoid conflicts
      git = {
        overrideGpg = true;
      };
    };
  };
}
