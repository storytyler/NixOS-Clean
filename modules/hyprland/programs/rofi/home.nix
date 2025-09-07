{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.rofi = let
    inherit (lib) getExe;
  in {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "${getExe pkgs.wezterm}";  # Hardcoded to avoid module argument issues
    
    plugins = with pkgs; [
      rofi-emoji-wayland # https://github.com/Mange/rofi-emoji 🤯
      rofi-games # https://github.com/Rolv-Apneseth/rofi-games 🎮
    ];
    
    # Theme handled by Stylix - removed manual theme to avoid conflicts
    
    extraConfig = {
      modi = "drun,run,window";
      show-icons = true;
      drun-display-format = "{name}";
      disable-history = false;
      hide-scrollbar = true;
      sidebar-mode = false;
    };
  };
}
