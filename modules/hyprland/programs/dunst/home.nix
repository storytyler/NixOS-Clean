{
  config,
  lib,
  pkgs,
  ...
}: {
  # Minimal dunst config - let Stylix handle theming with Dracula colors
  services.dunst = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    settings = {
      global = {
        # Essential positioning and behavior only
        origin = "top-right";
        width = "400";
        height = "400";
        notification_limit = 0;
        indicate_hidden = "yes";
        padding = 15;
        horizontal_padding = 15;
        frame_width = 2;
        corner_radius = 10;
        progress_bar = true;
        progress_bar_height = 14;
        
        # Browser for links
        browser = "zen --new-tab";
        
        # Let Stylix handle: fonts, colors, themes automatically
      };

      fullscreen_delay_everything = {fullscreen = "delay";};
    };
  };
}