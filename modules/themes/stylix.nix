{
  pkgs,
  wallpaper,
  ...
}: {
  # Minimal Stylix configuration - only enable what we actually use
  stylix = {
    enable = true;
    
    # CYBERPUNK wallpaper for maximum flashy vibes 🔥
    image = ./wallpapers/cyberpunk.jxl;
    
    # Dracula color scheme - perfect for cyberpunk aesthetic  
    base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
    
    # Configure fonts
    fonts = {
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
      serif = {
        package = pkgs.inter;
        name = "Inter";
      };
      sizes = {
        applications = 11;
        desktop = 10;
        popups = 10;
        terminal = 12;
      };
    };

    # Modern Stylix approach - let it auto-detect what's installed
    # Only configure what we definitely want controlled
    autoEnable = true;  # Auto-enable for installed programs
    
    # Override specific targets if needed
    targets = {
      # Ensure these core ones are enabled
      gtk.enable = true;
      console.enable = true;
      # Firefox warning is cosmetic - profileNames option may not exist in this Stylix version
      # Let autoEnable handle tmux and other programs
    };
  };
}